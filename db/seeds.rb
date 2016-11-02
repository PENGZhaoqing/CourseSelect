# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

class StudentGenerator

  def self.department
    DEPARTMENT.sample
  end

  def self.major
    MAJOR.sample
  end

  def self.name
    "#{first_name}#{last_name}"
  end

  def self.first_name
    FIRST_NAMES.sample
  end

  def self.last_name
    LAST_NAMES.sample
  end

  FIRST_NAMES = %w(赵 钱 孙 李 周 吴 郑 王 冯 陈 褚 卫 蒋 沈 韩 杨 朱 秦 尤 许 何 吕 施 张 孔 曹 严 华 金 魏 陶 姜 戚 谢 邹 喻 柏 水 窦 章 云 苏 潘 葛 奚 范 彭 郎 鲁 韦 昌 马 苗 凤 花 方 俞 任 袁 柳 酆 鲍 史 唐 费 廉 岑 薛 雷 贺 倪 汤  滕 殷 罗 毕 郝 邬 安 常 乐 于 时 傅  皮 卞 齐 康 伍 余 元 卜 顾 孟 平 黄  和 穆 萧 尹 姚 邵 湛 汪 祁 毛 禹 狄  米 贝 明 臧 计 伏 成 戴 谈 宋 茅 庞  熊 纪 舒 屈 项 祝 董 梁 杜 阮 蓝 闵  席 季 麻 强 贾 路 娄 危 江 童 颜 郭  梅 盛 林 刁 锺 徐 邱 骆 高 夏 蔡 田  樊 胡 凌 霍 虞 万 支 柯 昝 管 卢 莫  经 房 裘 缪 干 解 应 宗 丁 宣 贲 邓  郁 单 杭 洪 包 诸 左 石 崔 吉 钮 龚  程 嵇 邢 滑 裴 陆 荣 翁 荀 羊 於 惠  甄 麴 家 封 芮 羿 储 靳 汲 邴 糜 松  井 段 富 巫 乌 焦 巴 弓 牧 隗 山 谷  车 侯 宓 蓬 全 郗 班 仰 秋 仲 伊 宫  宁 仇 栾 暴 甘 钭 历 戎 祖 武 符 刘  景 詹 束 龙 叶 幸 司 韶 郜 黎 蓟 溥  印 宿 白 怀 蒲 邰 从 鄂 索 咸 籍 赖  卓 蔺 屠 蒙 池 乔 阳 郁 胥 能 苍 双  闻 莘 党 翟 谭 贡 劳 逄 姬 申 扶 堵  冉 宰 郦 雍 却 璩 桑 桂 濮 牛 寿 通  边 扈 燕 冀 僪 浦 尚 农 温 别 庄 晏  柴 瞿 阎 充 慕 连 茹 习 宦 艾 鱼 容  向 古 易 慎 戈 廖 庾 终 暨 居 衡 步  都 耿 满 弘 匡 国 文 寇 广 禄 阙 东  欧 殳 沃 利 蔚 越 夔 隆 师 巩 厍 聂  晁 勾 敖 融 冷 訾 辛 阚 那 简 饶 空  曾 毋 沙 乜 养 鞠 须 丰 巢 关 蒯 相  查 后 荆 红 游 竺 权 逮 盍 益 桓 公  万俟 司马 上官 欧阳 夏侯 诸葛 闻人 东方 赫连 皇甫 尉迟 公羊  澹台 公冶 宗政 濮阳 淳于 单于 太叔 申屠 公孙 仲孙 轩辕 令狐 钟离 宇文 长孙 慕容 司徒 司空 召 有 舜 叶赫那拉 丛 岳  寸 贰 皇 侨 彤 竭 端 赫 实 甫 集 象  翠 狂 辟 典 良 函 芒 苦 其 京 中 夕  之 章佳 那拉 冠 宾 香 果 依尔根觉罗 依尔觉罗 萨嘛喇 赫舍里 额尔德特  萨克达 钮祜禄 他塔喇 喜塔腊 讷殷富察 叶赫那兰 库雅喇 瓜尔佳 舒穆禄 爱新觉罗 索绰络 纳喇  乌雅 范姜 碧鲁 张廖 张简 图门 太史 公叔 乌孙 完颜 马佳 佟佳  富察 费莫 蹇 称 诺 来 多 繁 戊 朴 回 毓  税 荤 靖 绪 愈 硕 牢 买 但 巧 枚 撒  泰 秘 亥 绍 以 壬 森 斋 释 奕 姒 朋  求 羽 用 占 真 穰 翦 闾 漆 贵 代 贯  旁 崇 栋 告 休 褒 谏 锐 皋 闳 在 歧  禾 示 是 委 钊 频 嬴 呼 大 威 昂 律  冒 保 系 抄 定 化 莱 校 么 抗 祢 綦  悟 宏 功 庚 务 敏 捷 拱 兆 丑 丙 畅  苟 随 类 卯 俟 友 答 乙 允 甲 留 尾  佼 玄 乘 裔 延 植 环 矫 赛 昔 侍 度  旷 遇 偶 前 由 咎 塞 敛 受 泷 袭 衅  叔 圣 御 夫 仆 镇 藩 邸 府 掌 首 员  焉 戏 可 智 尔 凭 悉 进 笃 厚 仁 业  肇 资 合 仍 九 衷 哀 刑 俎 仵 圭 夷  徭 蛮 汗 孛 乾 帖 罕 洛 淦 洋 邶 郸  郯 邗 邛 剑 虢 隋 蒿 茆 菅 苌 树 桐  锁 钟 机 盘 铎 斛 玉 线 针 箕 庹 绳  磨 蒉 瓮 弭 刀 疏 牵 浑 恽 势 世 仝  同 蚁 止 戢 睢 冼 种 涂 肖 己 泣 潜  卷 脱 谬 蹉 赧 浮 顿 说 次 错 念 夙  斯 完 丹 表 聊 源 姓 吾 寻 展 出 不  户 闭 才 无 书 学 愚 本 性 雪 霜 烟  寒 少 字 桥 板 斐 独 千 诗 嘉 扬 善  揭 祈 析 赤 紫 青 柔 刚 奇 拜 佛 陀  弥 阿 素 长 僧 隐 仙 隽 宇 祭 酒 淡  塔 琦 闪 始 星 南 天 接 波 碧 速 禚  腾 潮 镜 似 澄 潭 謇 纵 渠 奈 风 春  濯 沐 茂 英 兰 檀 藤 枝 检 生 折 登  驹 骑 貊 虎 肥 鹿 雀 野 禽 飞 节 宜  鲜 粟 栗 豆 帛 官 布 衣 藏 宝 钞 银  门 盈 庆 喜 及 普 建 营 巨 望 希 道  载 声 漫 犁 力 贸 勤 革 改 兴 亓 睦  修 信 闽 北 守 坚 勇 汉 练 尉 士 旅  五 令 将 旗 军 行 奉 敬 恭 仪 母 堂  丘 义 礼 慈 孝 理 伦 卿 问 永 辉 位  让 尧 依 犹 介 承 市 所 苑 杞 剧 第  零 谌 招 续 达 忻 六 鄞 战 迟 候 宛  励 粘 萨 邝 覃 辜 初 楼 城 区 局 台  原 考 妫 纳 泉 老 清 德 卑 过 麦 曲  竹 百 福 言 第五 佟 爱 年 笪 谯 哈 墨  南宫 赏 伯 佴 佘 牟 商 西门 东门 左丘 梁丘 琴  后 况 亢 缑 帅 微生 羊舌 海 归 呼延 南门 东郭  百里 钦 鄢 汝 法 闫 楚 晋 谷梁 宰父 夹谷 拓跋  壤驷 乐正 漆雕 公西 巫马 端木 颛孙 子车 督 仉 司寇 亓官  鲜于 锺离 盖 逯 库 郏 逢 阴 薄 厉 稽 闾丘  公良 段干 开 光 操 瑞 眭 泥 运 摩 伟 铁 迮)
  LAST_NAMES = %w(宝昌 之启  书宣  光弘  诚智  喜佩  欢莹  瑜念  昱行  雨钰  百鑫  睿妤  贤俐  枝淑  丰恬  宜玫  贵孝  汝勇  卉齐  宣华  康伟  季虹  为博  安慧  亮绿  军彬  容城  世帆  金宏  重元  坚夫  思凯  恆琳  妤书  琪幸  旻幸  松祯  宣源  淑峰  诚妃  夙仪  倩蓉  姿伶  纬妹  年琴  康贞  巧吉  其芸  铭桂  忠江  幼孝  雨乐  典昀  兴绮  志中  玟惟  协定  忠孝  洁安  淑定  雯东  仪年  心中  琇修  丞达  冰雅  昭仲  孟鑫  雅亚  孝郁  其峰  薇芷  智和  兆乔  翰星  颖意  亚新  纯苹  信念  以瑞  邦钰  添宜  思乔  天惟  昌淳  卉廷  豪华  江吟  柏豪  羽佳  孝哲  韵麟  儒年  丞坚  骏欣  琦全  柏宇  长念  汝名  治玫  嘉旺  枝易  念一  民乐  文雄  利英  俊苹  俞嘉  雯吟  琇旭  玲嘉  白富  伯名  璇孜  昀昆  秉安  秀桂  鸿迪  念琇  致年  修纯  映郁  忠妤  恒鑫  皓俊  隆彬  杰苓  俊雄  幼嘉  子善  尚湖  盈钰  清妤  佑华  恒汉  白哲  协纬  茵绍  吉龙  翰欣  定杰  少原  亚萱  舜欣  天亨  青茜  一乔  恬齐  上映  妍韦  利正  展冰  明荣  然士  玉茜  夫顺  茂全  明梦  清芸  如发  皓桦  宸鑫  泓豪  柏治  吉行  和嘉  仁行  建新  行信  昌良  珍舜  江钰  慈白  佐民  如原  义如  恒哲  奕行  玮瑞  柔来  柏茹  辛绮  江原  伟来  坤萱  瑞枝  孜汉  爱昌  盛纯  沛蓁  洁智  和宸  筠芬  克刚  明桦  琦美  正哲  萱娟  韦祥  必隆  如航  百隆  幸宣  祯行  丞然  尧旺  倩幸  琦岳  皓娥  胤安  月纶  均湖  人月  昇孝  旻夫  睿皓  阳琬  平恩  劭弘  尹玉  宸宁  意慈  舜音  阿琬  东男  爱伦  和行  以其  志俊  廷江  姿君  弘善  中芳  成亦  桓政  信斌  迪琦  欣怡  劭青  钰甫  皓坚  平诚  介玟  礼宇  侑青  佩妏  诚铭  方韦  珮莲  初帆  奕峰  延欣  郁嘉  梦盈  嘉雄  辰洋  克白  南君  苓妹  珍士  娇正  法甫  孜定  长桦  其坤  俐达  妏妹  智君  添弘  原芳  台谷  人轩  洋杰  如冰  屏政  湖德  能扬  玟珍  郁希  一意  成淑  昆坚  盛吟  初辛  柔瑶  靖芸  仲欣  钰昌  德州  伟源  昱治  雅弘  伊妹  安雪  仕月  群紫  登慧  璇光  恩君  珮侑  亨诚  士诚  毓映  廷吉  政怡  安紫  姵季  立仪  之一  卉裕  慈伦  巧伟  致孜  刚妹  妏珍  珮能  昀能  典靖  政嘉  忠洁  纹智  江汉  侑萱  石琪  瑜人  禾宇  蕙臻  芸安  伶秀  珍岳  仪如  琬利  采勇  少珊  恬仁  儒泉  英刚  克廷  妏南  典夫  之名  茂萍  春定  民政  新妤  百乐  雅迪  宣萍  郁豪  智怡  珮梦  钰明  柔正  文岳  颖蓁  凡仪  正汝  林谦  美爱  启爱  佩  纯利  绍铭  茜彦  亦南  辰博  映凯  怡绿  然云  谷香  奇菱  宇绍  延霞  茵盛  为成  可人  亨琦  明惟  紫玲  合玲  薇绿  永坤  盈俐  玫昇  玲伶  小忠  仲弘  铭治  水念  郁俐  禾刚  思梅  以富  爱恬  文钰  元城  振君  铭源  克花  军恬  博吟  慧幸  方星  育名  右治  妙桦  纯珍  泰宏  振香  启卿  荣恭  冠迪  长霞  燕谦  青亨  江莲  柏秀  乐岑  富祥  惠孜  士芸  卉乔  绍仪  泓宸  毓哲  弘莹  淳原  星隆  书忠  吉云  然杰  昇来  立梅  晋瑄  纹欣  希妹  芳琦  以彬  华松  中心  卉鑫  翰伶  桓原  展霖  玲坚  吟美  隆绮  容辰  品修  之皓  苓海  采州  财珍  白豪  孜雄  萱俐  财如  信乔  又季  杰瑶  璇城  思妮  如士  秀德  雪其  芸紫  乐齐  玲宇  郁桓  宥昆  宣任  士夫  隆治  廷绍  玉善  琪宜  侑娟  绮名  昇屏  芸舜  英妤  梦倩  伸君  安纯  音嘉  玄君  志生  山发  皇强  坚舜  香芝  火书  致盈  春俐  玲俊  修男  云淳  幼隆  雯佳        旻琪  延法  庭山  于瑶  书竹  维莹  屏宜  瑶任  梅人  哲皓  顺孝  重良  成珮  俞萍  禾仁  竹诚  家博  新苹  智人  山甫  芝隆  贤志  青臻  梅湖  尚生  元华  威芸  宥辉  茹鑫  卉凌  靖辉  妮侑  亭仁  音皓  延龙  上来  宣岑  书琬  鸿郁  洁昇  姵育  为菱  名新  骏书  能琪  白铭  凤幸  勇绿  良源  佑淑  骏宸  丹亦  宛泉  新良  然宜  政绮  宸瑜  伯坤  妙韦  春琪  真旺  柔冰  信喜  辛铭  育诚  木诚  竹睿  竹士  真念  佐谕  星皓  礼恭  新宇  佑霞  杰夫  人蓉  思维  君玉  昆凡  小琴  俐军  佩如  友玟  其昆  芳峰  纬毓  伟乐  左洋  宛芳  萱莲  杰香  妏恭  屏帆  行睿  博孜  勇倩  振娟  迪齐  香心  正勇  奕枝  宛意  念然  夫桦  喜月  冠任  力侑  茂易  中沛  政月  伊华  克宏  裕琳  登云  昱侑  思男  玄雪  吟蓁  韵慈  旺智  丰如  诚裕  柏湖  忠宁  惠汉  盈宇  彦昇  乐祥  阳琦  昆轩  雨钰  勇妃  舜瑄  喜哲  旭琳  旻纬  杰迪  立菱  利贵  善真  韦瑞  安惠  雪博  东人  力莹  枝雨  宏禾  士昆  宁均  廷霖  虹智  城坚  智佩  奇雪  珍心  上龙  阳青  卉妃  岑良  湖卿  新郁  乔孝  俐舜  亮凡  昕茂  沛舜  子妤  皓吉  沛汉  洋亚  白轩  雨纶  伶雄  行文  珮康  致芳  兆萱  安瑄  甫谦  姵富  千东  贵菁  妍茜  恬妮  俊伶  芷睿  瑜名  瑜峰  能纬  纯瑄  姵爱  妤睿  琦辛  松香  琬苹  妤治  智泰  奇莹  凯蓉  中惟  燕妤  中宸  年仁  正孝  城桦  义俐  品男  薇坚  昆阳  品群  育莹  亭毓  维紫  宣迪  易心  孝羽  妏虹  虹亨  骏哲  淑信  仰钰  铭玟  荣月  伸民  初贵  合雪  宜祯  典然  致信  幼沛  香智  立岳  伯尧  和容  承茜  羽维  玉迪  仪嘉  易雯  鸿蓁  季蓁  承夫  重生  劭峰  玟俊  仕宜  合纯  燕忠  立旺  兴伦  昭雨  丹仪  必政  汉郁  孝瑞  念辛  岑汝  欣蓉  纬刚  秋  容易  信任  夫  光婷  初志  玄萍  以安  水娟  林茜  靖映  乐松  坤喜  恬扬  芸瑄  群惟  桓坤  凡莹  芷雅  仪文  芃湖  月岑  雪海  维茵  铭旺  慧中  荣桂  冠宁  羽芸  人茂  夫东  妮念  紫钰  中伟  左慧  建士  民荣  希忠  百芷  子均  妏湖  奇雅  礼舜  彦元  新鑫  尚仲  郁齐  枝臻  添佳  辰成  晋珊  亨茵  兰宣  若绮  禾东  思睿  桂伯  春亨  夙嘉  光容  家绿  勇昆  惠倩  祯香  希志  奇东  灿郁  月伶  一汝  依友  夙忠  雨谦  政威  尹隆  廷新  裕吉  长希  弘隆  郁音  俐孝  惟音  宥毓  仲纬  扬皓  方桦  添臻  舜羽  孝绿  南雯  劭信  儒映  年伶  建意  妮峰  桓军  颖亚  苓民  仲花  廷青  富梅  幸轩  怡珠  振蓁  世真  承春  贵蓉  南莹  洁维  群婷  百修  慈阳  昭梦  惠源  雯隆  致士  美弘  光昇  瑶凯  杰旺  毓昌  绿恬  富纯  佳维  千中  彦芷  茹山  秉伟  康纶  映意  鑫祥  杰德  修美  宛雅  新乐  梅芝  德怡  晋麟  夙其  美良  函良  芃勇  琇航  行妮  纯祯  玉利  岳易  邦贞  巧群  民州  志仲  贵夫  柏舜  雅伦  惟阳  乃仁  又政  香士  胤帆  勇年  希喜  彦行  天茹  右城  屏元  枝琳  郁秀  云姗  姵书  子吉  亨芸  云沛  育汉  尹全  成花  伟东  夫海  云隆  芝桦  函志  亚瑞  姿人  于荣  善政  胤洋  春念  勇宸  洁淑  坤秋  星宸  政铭  雅孜  合云  昀发  燕宸  意仲  燕靖  铭雯  皇芳  惠人  中芸  莹芳  希杰  任洋  廷婷  卉冰  安一  莹达  孟辰  迪光  姵善  奇婷  韵昇  百达  睿义  扬桦  冰慈  昀诚  茂斌  孜容  星映  祥纯  映宣  又雄  慈玫  原霞  振玫  仕康  慈紫  劭桓  意军  毓维  山名  方纬  璇珊  星桦  鑫洋  苓乔  添香  屏蓁  伦君  永贵)

  MAJOR= %w(计算机系统结构 控制理论与控制工程 模式识别与智能系统 计算机应用技术 通信与信息系统 信息安全 计算机软件与理论)
  DEPARTMENT= %w(计算机与控制学院 软件研究所 计算机技术研究所 自动化研究所 信息工程研究所)

end

#-------------------------------------------------------------------------------------


User.create(
    name: "彭兆卿",
    email: "admin@test.com",
    num: "201628008629001",
    major: "计算机软件与理论",
    department: "计算机与控制学院",
    password: "password",
    password_confirmation: "password",
    admin: true
)

teacher_map={
    1 => {name: "胡伟武", department: "计算技术研究所"},
    2 => {name: "谢高岗", department: "计算机与控制学院"},
    3 => {name: "魏峻", department: "软件研究所"},
    4 => {name: "罗铁坚", department: "计算机与控制学院"},
    5 => {name: "眭跃飞", department: "软件研究所"},
    6 => {name: "卜东波", department: "计算技术研究所"},
    7 => {name: "黄庆明", department: "计算机与控制学院"},
    8 => {name: "程学旗", department: "计算技术研究所"},
    9 => {name: "李晓维", department: "计算技术研究所"},
    10 => {name: "齐洪钢", department: "计算机与控制学院"},
    11 => {name: "刘莹", department: "计算机与控制学院"},
    12 => {name: "冯晓兵", department: "计算技术研究所"},
    13 => {name: "杨力祥", department: "计算机与控制学院"},
    14 => {name: "林惠民", department: "软件研究所"},
    15 => {name: "姚刚", department: "信息工程研究所"},
    16 => {name: "王宏安", department: "软件研究所"},
    17 => {name: "徐君", department: "计算技术研究所"},
    18 => {name: "何清", department: "计算技术研究所"},
    19 => {name: "时磊", department: "软件研究所"},
    20 => {name: "王飞跃", department: "自动化研究所"},
    21 => {name: "刘成林", department: "自动化研究所"},
    22 => {name: "张文生", department: "自动化研究所"},
    23 => {name: "王伟强", department: "心理研究所"},
    24 => {name: "徐德", department: "自动化研究所"},
    25 => {name: "李保滨", department: "计算机与控制学院"},
    26 => {name: "何苯", department: "计算机与控制学院"},
    27 => {name: "张颢", department: "计算机与控制学院"},
    28 => {name: "刘智勇", department: "自动化研究所"},
    29 => {name: "赵军锁", department: "软件研究所"},
    30 => {name: "陈玉福", department: "软件研究所"},
    31 => {name: "刘玉贵", department: "计算机与控制学院"},
    32 => {name: "王文杰", department: "计算机与控制学院"},
    33 => {name: "苏桂平", department: "计算机与控制学院"},
    34 => {name: "张晋连", department: "计算机与控制学院"}
}

course_map={
    1 => {course_code: "091M4001H", name: "计算机体系结构", course_type: "专业核心课", credit: "60/3.0", limit_num: "", course_week: "第2-20周", course_time: "周一(9-11)", class_room: "教1-107", teaching_type: "课堂讲授为主", exam_type: "闭卷笔试", course_introduction: "aaa"},
    2 => {course_code: "091M4002H", name: "计算机网络", course_type: "专业核心课", credit: "60/3.0", limit_num: "", course_week: "第2-20周	", course_time: "周五(2-4)", class_room: "教1-107", teaching_type: "课堂讲授为主", exam_type: "闭卷笔试", course_introduction: "aaa"},
    3 => {course_code: "091M4021H-1", name: "高级软件工程", course_type: "一级学科核心课", credit: "60/3.0", limit_num: "", course_week: "第2-20周	", course_time: "周四(9-11)", class_room: "教1-109", teaching_type: "授课、讨论	", exam_type: "闭卷笔试", course_introduction: "aaa"},
    4 => {course_code: "091M4021H-2", name: "高级软件工程", course_type: "一级学科核心课", credit: "60/3.0", limit_num: "", course_week: "第2-20周	", course_time: "周三(9-11)", class_room: "教1-109", teaching_type: "授课、讨论	", exam_type: "闭卷笔试", course_introduction: "aaa"},
    5 => {course_code: "091M4023H", name: "数理逻辑与程序理论", course_type: "专业核心课", credit: "60/3.0", limit_num: "", course_week: "第2-20周	", course_time: "周二(5-7)", class_room: "教1-113", teaching_type: "课堂讲授为主", exam_type: "闭卷笔试", course_introduction: "aaa"},
    6 => {course_code: "091M4041H", name: "计算机算法设计与分析", course_type: "专业核心课", credit: "60/3.0", limit_num: 250, course_week: "第2-20周	", course_time: "周五(2-4)", class_room: "教1-101", teaching_type: "课堂讲授为主", exam_type: "闭卷笔试", course_introduction: "aaa"},
    7 => {course_code: "091M4042H", name: "模式识别与机器学习", course_type: "专业核心课", credit: "60/3.0", limit_num: 450, course_week: "第2-20周	", course_time: "周一(5-7)", class_room: "教1-102", teaching_type: "课堂讲授为主", exam_type: "闭卷笔试", course_introduction: "aaa"},
    8 => {course_code: "091M4043H", name: "高级人工智能", course_type: "专业核心课", credit: "60/3.0", limit_num: "", course_week: "第2-20周", course_time: "周二(9-11)", class_room: "教1-107", teaching_type: "课堂讲授为主", exam_type: "闭卷笔试", course_introduction: "aaa"},
    9 => {course_code: "091M5001H", name: "VLSI测试与可测试性设计", course_type: "专业普及课", credit: "40/2.0", limit_num: "", course_week: "第2-16周	", course_time: "周二(9-11)", class_room: "教1-109", teaching_type: "课堂讲授为主", exam_type: "课堂开卷", course_introduction: "aaa"},
    10 => {course_code: "091M5004H", name: "超大规模集成电路基础", course_type: "专业普及课", credit: "40/2.0", limit_num: "", course_week: "第2-16周	", course_time: "周四(5-7)", class_room: "教1-413", teaching_type: "课堂讲授为主", exam_type: "课堂开卷", course_introduction: "aaa"},
    11 => {course_code: "091M5023H", name: "数据挖掘", course_type: "专业普及课", credit: "46/2.0", limit_num: 450, course_week: "第2-14周	", course_time: "周一(1-2)", class_room: "教1-101", teaching_type: "课堂讲授为主", exam_type: "课堂开卷", course_introduction: "aaa"},
    12 => {course_code: "091M5024H", name: "编译程序高级教程", course_type: "专业普及课", credit: "40/2.0", limit_num: "", course_week: "第2-18周	", course_time: "周一(5-7)", class_room: "教1-108", teaching_type: "课堂讲授为主", exam_type: "课堂开卷", course_introduction: "aaa"},
    13 => {course_code: "091M5025H", name: "操作系统高级教程", course_type: "专业普及课", credit: "40/2.0", limit_num: "", course_week: "第2-12周	", course_time: "周三(7-8)", class_room: "教1-101", teaching_type: "课堂讲授为主", exam_type: "课堂开卷", course_introduction: "aaa"},
    14 => {course_code: "091M5026H", name: "并发数据结构与多核编程", course_type: "专业普及课", credit: "40/2.0", limit_num: "", course_week: "第2-17周	", course_time: "周四(5-7)", class_room: "教1-109", teaching_type: "课堂讲授为主", exam_type: "课堂开卷", course_introduction: "aaa"},
    15 => {course_code: "091M5027H", name: "形式语言与自动机理论", course_type: "专业普及课", credit: "40/2.0", limit_num: "", course_week: "第2-17周	", course_time: "周五(5-7)", class_room: "教1-113", teaching_type: "课堂讲授为主", exam_type: "课堂开卷", course_introduction: "aaa"},
    16 => {course_code: "091M5041H", name: "人机交互", course_type: "专业普及课", credit: "40/2.0", limit_num: "", course_week: "第2-17周", course_time: "周三(5-7)", class_room: "教1-108", teaching_type: "课堂讲授为主", exam_type: "课堂开卷", course_introduction: "aaa"},
    17 => {course_code: "091M5042H", name: "网络数据挖掘", course_type: "专业普及课", credit: "40/2.0", limit_num: "", course_week: "第2-17周	", course_time: "周二(5-7)", class_room: "教1-107", teaching_type: "课堂讲授为主", exam_type: "闭卷笔试", course_introduction: "aaa"},
    18 => {course_code: "091M6043H", name: "认知计算", course_type: "专业研讨课", credit: "20/1.0", limit_num: 40, course_week: "第2-12周", course_time: "周四(5-6)	", class_room: "教1-123", teaching_type: "授课、讨论	", exam_type: "读书报告", course_introduction: "aaa"},
    19 => {course_code: "091M6045H", name: "可视化与可视计算", course_type: "专业研讨课", credit: "20/1.0", limit_num: 40, course_week: "第2-8,10-12周	", course_time: "周五(5-6)", class_room: "教1-123", teaching_type: "授课、讨论	", exam_type: "读书报告", course_introduction: "aaa"},
    20 => {course_code: "092M4001H", name: "最优控制理论", course_type: "专业核心课", credit: "60/3.0", limit_num: "", course_week: "第3-6,8-20周	", course_time: "周二(3-4)", class_room: "教1-109", teaching_type: "课堂讲授为主", exam_type: "闭卷笔试", course_introduction: "aaa"},
    21 => {course_code: "092M4002H", name: "模式识别", course_type: "专业核心课", credit: "60/3.0", limit_num: "", course_week: "第2-20周	", course_time: "周三(9-11)", class_room: "教1-102", teaching_type: "课堂讲授为主", exam_type: "闭卷笔试", course_introduction: "aaa"},
    22 => {course_code: "092M4022H", name: "人工智能理论与实践", course_type: "专业核心课", credit: "60/3.0", limit_num: "", course_week: "第2-20周	", course_time: "周四(9-11)", class_room: "教1-109", teaching_type: "授课、讨论	", exam_type: "闭卷笔试", course_introduction: "aaa"},
    23 => {course_code: "092M4023H", name: "图像处理与分析", course_type: "专业核心课", credit: "60/3.0", limit_num: "", course_week: "第2-4,6-18周	", course_time: "周二(1-2)", class_room: "教1-102", teaching_type: "课堂讲授为主", exam_type: "闭卷笔试", course_introduction: "aaa"},
    24 => {course_code: "092M5002H", name: "机器人学导论", course_type: "专业普及课", credit: "40/2.0", limit_num: "", course_week: "第2-16周	", course_time: "周五(5-7)", class_room: "教1-109", teaching_type: "课堂讲授为主", exam_type: "课堂开卷", course_introduction: "aaa"},
    25 => {course_code: "092M5006H", name: "矩阵分析与应用", course_type: "专业普及课", credit: "40/2.0", limit_num: "", course_week: "第2-12周	", course_time: "周三(1-2)", class_room: "教1-102", teaching_type: "课堂讲授为主", exam_type: "闭卷笔试", course_introduction: "aaa"},
    26 => {course_code: "092M5025H", name: "现代信息检索", course_type: "专业普及课", credit: "40/2.0", limit_num: "", course_week: "第2-12周	", course_time: "周三(3-4)", class_room: "教1-109", teaching_type: "课堂讲授为主", exam_type: "课堂开卷", course_introduction: "aaa"},
    27 => {course_code: "092M5026H", name: "随机过程", course_type: "专业普及课", credit: "40/2.0", limit_num: "", course_week: "第2-17周	", course_time: "周三(5-7)", class_room: "教1-109", teaching_type: "课堂讲授为主", exam_type: "读书报告", course_introduction: "aaa"},
    28 => {course_code: "092M6001H", name: "机器视觉及其应用", course_type: "专业研讨课", credit: "20/1.0", limit_num: 40, course_week: "第10-19周	", course_time: "周三(5-6)", class_room: "教1-125", teaching_type: "授课、讨论	", exam_type: "读书报告", course_introduction: "aaa"},
    29 => {course_code: "092M6002H", name: "嵌入式系统", course_type: "专业研讨课", credit: "20/1.0", limit_num: 40, course_week: "第2-12周	", course_time: "周四(9-10)", class_room: "教1-115", teaching_type: "课堂讲授为主", exam_type: "闭卷笔试", course_introduction: "aaa"},
    30 => {course_code: "093M1002H-1", name: "计算机算法设计与分析", course_type: "一级学科核心课", credit: "60/3.0", limit_num: 220, course_week: "第2-17周	", course_time: "周二(1-2)", class_room: "教1-101", teaching_type: "课堂讲授为主", exam_type: "闭卷笔试", course_introduction: "aaa"},
    31 => {course_code: "093M1002H-2", name: "计算机算法设计与分析", course_type: "一级学科核心课", credit: "60/3.0", limit_num: 150, course_week: "第2-17周	", course_time: "周三(1-2)", class_room: "教1-108", teaching_type: "讲课、上机", exam_type: "闭卷笔试", course_introduction: "aaa"},
    32 => {course_code: "093M1002H-3", name: "计算机算法设计与分析", course_type: "一级学科核心课", credit: "60/3.0", limit_num: 220, course_week: "第5-20周	", course_time: "周二(3-4)", class_room: "教1-101", teaching_type: "课堂讲授为主", exam_type: "闭卷笔试", course_introduction: "aaa"},
    33 => {course_code: "093M2007H", name: "数据库新技术", course_type: "一级学科普及课", credit: "40/2.0", limit_num: "", course_week: "第2-12周	", course_time: "周一(3-4)", class_room: "教1-107", teaching_type: "课堂讲授为主", exam_type: "闭卷笔试", course_introduction: "aaa"},
    34 => {course_code: "09MGX005H", name: "Python语言导论", course_type: "公共选修课", credit: "40/1.0", limit_num: 154, course_week: "第4-14周	", course_time: "周二(7-8)", class_room: "教1-108", teaching_type: "课堂讲授为主", exam_type: "课堂开卷", course_introduction: "aaa"},
}

teacher_map.keys.each do |index|
  teacher=User.create!(
      name: teacher_map[index][:name],
      email: "teacher#{index}@test.com",
      department: teacher_map[index][:department],
      password: "password",
      password_confirmation: "password",
      teacher: true
  )

  teacher.teaching_courses.create!(
      course_code: course_map[index][:course_code],
      name: course_map[index][:name],
      course_type: course_map[index][:course_type],
      credit: course_map[index][:credit],
      limit_num: course_map[index][:limit_num],
      course_week: course_map[index][:course_week],
      course_time: course_map[index][:course_time],
      class_room: course_map[index][:class_room],
      teaching_type: course_map[index][:teaching_type],
      exam_type: course_map[index][:exam_type],
  )

end

(1..200).each do |index|
  student=User.create!(
      name: StudentGenerator.name,
      email: "student#{index}@test.com",
      num: "2016#{Faker::Number.number(11)}",
      major: StudentGenerator.major,
      department: StudentGenerator.department,
      password: "password",
      password_confirmation: "password",
  )

  course_array=(1..34).to_a.sort { rand() - 0.5 }[1..rand(4..8)]
  course_array.each do |index|
    student.courses<<Course.find(index)
  end

end
















