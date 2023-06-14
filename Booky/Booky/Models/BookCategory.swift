//
//  BookCategory.swift
//  Booky
//
//  Created by J.E on 2023/05/24.
//

enum BookCategory: Int, Codable {
    
    case all = 0
    case literature = 1
    case unClassified = 10
    case history = 74
    case economicsManagement = 170
    case selfDevelopment = 336
    case computerMobile = 351
    case artsAndPopCulture = 517
    case humanities = 656
    case socialSciences = 798
    case science = 987
    case children = 1108
    case youth = 1137
    case travel = 1196
    case cookingAndLiving = 1230
    case religionAndOccult = 1237
    case foreignLanguage = 1322
    case examAndCertificationGuideBooks = 1383
    case goodParents = 2030
    case comics = 2551
    case magazines = 2913
    case koreanBookWrittenInEnglish = 8981
    case audioBooks = 6653
    case universityTextbooks = 8257
    case toddlers = 13789
    case completeWorks = 17195
    case governmentEmployeeExamGuideBooks = 34582
    case elementaryWorkBooks = 50246
    case essays = 55889
    case healthAndHobby = 55890
    case middleSchoolWorkBooks = 76000
    case highSchoolWorkBooks = 76001
    case genreNovels = 112011
    case biggerFontBooks = 184996
    
    init(id: Int) {
        if let category = BookCategory(rawValue: id) {
            self = category
        } else {
            self = .unClassified
        }
    }
    
    var name: String {
        switch self {
        case .all:
            return "전체"
        case .literature:
            return "소설/시/희곡"
        case .history:
            return "역사"
        case .economicsManagement:
            return "경제경영"
        case .selfDevelopment:
            return "자기계발"
        case .computerMobile:
            return "컴퓨터/모바일"
        case .artsAndPopCulture:
            return "예술/대중문화"
        case .humanities:
            return "인문학"
        case .socialSciences:
            return "사회과학"
        case .science:
            return "과학"
        case .children:
            return "어린이"
        case .youth:
            return "청소년"
        case .travel:
            return "여행"
        case .cookingAndLiving:
            return "요리/살림"
        case .religionAndOccult:
            return "종교/역학"
        case .foreignLanguage:
            return "외국어"
        case .examAndCertificationGuideBooks:
            return "수험서/자격증"
        case .goodParents:
            return "좋은부모"
        case .comics:
            return "만화"
        case .magazines:
            return "잡지"
        case .koreanBookWrittenInEnglish:
            return "영어로 쓰인 한국서적"
        case .audioBooks:
            return "오디오북"
        case .universityTextbooks:
            return "대학교재"
        case .toddlers:
            return "유아"
        case .completeWorks:
            return "전집"
        case .governmentEmployeeExamGuideBooks:
            return "공무원 수험서"
        case .elementaryWorkBooks:
            return "초등참고서"
        case .essays:
            return "에세이"
        case .healthAndHobby:
            return "건강/취미"
        case .middleSchoolWorkBooks:
            return "중학교참고서"
        case .highSchoolWorkBooks:
            return "고등학교참고서"
        case .genreNovels:
            return "장르소설"
        case .biggerFontBooks:
            return "큰글자책"
        case .unClassified:
            return "미분류"
        @unknown case _:
            return "기타"
        }
    }
    
}

extension BookCategory: CaseIterable, Hashable {
    
    static func == (lhs: BookCategory, rhs: BookCategory) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
    
}
