-- model

local function createModel()
    local M1 = nn.Sequential()
    M1:add(nn.Linear(256, 256))
    M1:add(nn.ReLU())
    M1:add(nn.Linear(256, 256))
    -- M1:add(nn.Tanh())

    local M2 = nn.Sequential()
    M2:add(nn.Linear(64, 64))
    M2:add(nn.ReLU())
    M2:add(nn.Linear(64, 64))
    -- M2:add(nn.Tanh())

    local M3 = nn.Sequential()
    M3:add(nn.Linear(10, 10))
    M3:add(nn.ReLU())
    M3:add(nn.Linear(10, 10))
    -- M3:add(nn.Tanh())

    -- 模型
    local model = nn.Sequential()
    model:add(nn.DNI(nn.Sequential():add(nn.Linear(32*32, 256)):add(nn.ReLU()), M1, nn.MSECriterion()))
    model:add(nn.DNI(nn.Sequential():add(nn.Linear(256, 64)):add(nn.ReLU()), M2, nn.MSECriterion()))
    model:add(nn.DNI(nn.Linear(64, 10), M3, nn.MSECriterion()))

    -- 初始化参数
    for k, param in ipairs(model:parameters()) do
        param:normal(-0.01, 0.01)
    end

    return model
end

model = createModel()










