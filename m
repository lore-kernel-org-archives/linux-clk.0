Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594032D9798
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314765; cv=none; b=GEwfyunDN63rJ+s/KGQ0IVtJXXi7EQnTkUggx0nOzFKa1rGi6cIp3+EF2xbOvpa6t6uDY9tLNNMIFa/taI773HHlyM93Qz3vQwQ0I48rGYVxTuvafGphr/pXbXzk5sgdNYhV7bXCMGopvWZlmQ3VoIho2ninhcVeBUTKJuW2UEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314765; c=relaxed/simple;
	bh=ljNAanNsQX3haUgfK2VNArM8xCcxc69jvU1l9y/w+to=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MwfNRr7ad50KoR7IejHx4fsSjw1BxuaOd90V+3JNdLlbL/ZukyfdVPaQndwNjh3d9IkahmeHHxIYDCLvnIC26jWDeuKvbATWtZKKjs3NmYr4yraGr2HskC+G+ZFJlRz8CnBAboExTApECWiyY7dfmQAG6I+jygJVkhv6DxUeu14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g93e3sep; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bdZt3y0s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g93e3sep";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bdZt3y0s"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H54M8u2111529
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=; b=g93e3sepjWrNTdhq
	/KVLdzNZiaWehs0tpxuGBjv5+0uS3LkXr1LZbeqzjGBIE914a6JkIXDqv5maLfvX
	66WHMwfS004FDtnb6riOiKvwYRLzD0vhZuf9Fd2T981Rl9m0GtyPLQDQYH5prz5h
	Pm7liXqMBHG77A1dxf7wdISX8NaC6MvCVjEuPnrgtKDB2LVU2IzokOQhC5QsG6+N
	lhCc892In4brusw8D9lRv1ZjodQgQpGj79mNw1Ym/vqEP3iWm3YQXEuvTlRN8EP3
	8zhu4bZlJhYIwgxo7HhIot6hHlnmMl9MqFAH4TQM01PPO+kgJYbK7KLOTyi2VJza
	qPBeFg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cchv4gaed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:52:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb5359e9d3so1975957885a.2
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 23:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771314762; x=1771919562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=;
        b=bdZt3y0sl6tFonuaXSmZoh1fPT5+nd7KYUhDCqaJPxyBzDlJ75Q4Q4iyhilaUU/nPn
         8DTWF2DUL/B/0S3gZ4H2MHIFm4xxG14AkMoghNGVA9ioPqIpwtpRH9+gXKPuVw4+HZ5k
         NScA8u5rxX7DIAvVnHcw3VE2wKmDllLI6rO2B+lCv2iSpQOC0cJXy2wD9ox7a3guEw6H
         5u3bQUGLvpro/fUarL6oplwCvBmcSEOOLI1laq6vuBtKWn6z2fQxlmKrjxEc0isHaWUo
         J8EcAemw1DyeVQgD4ShPYCoF9HpSF+a+vh0RnFeiDaquRzYVFDveeSYsE+CGV62lG1+q
         7u8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771314762; x=1771919562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=;
        b=AeNVVaJLgFdnM/6HKtgnGdqluaY4UlQuVRs7yegsWAIjibQRiGBhhSJr/qpX4QAlFY
         TTx6ZC6LQ8wPDw/P3QfiS92EM5qn+RYBZ0BnLgqTVauzaum7OUmp+yQyeDk5pfwQsVID
         U0G6bwNUmJVlBUFPEt2oWSeQFrmdWuOEXxTVN6PGvMQ79arvWuvejEhP0ShQiCjSIgLv
         qCc8QjnJ+ESMCAR6CN3wdZxN0h6cT5K18v2iLxrcvioWeeDsS8Pk0EcJZZlKXqNhfl3i
         GhEfoM+G+ndDfvwHw0vB9x8gUjmtSD5uC8XtBN8t9b2b5ZWCYTe2dQkIL1y5xc+q5C18
         rVhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0uyci4s3eSAGVniFaNS1+eFG44gcBUQ7aVcYvANyjFP1AOu3X+OrkfJZsqxXHUnMy2mcDsoFs8DE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8SxlttntvtZ2r5FWPHfY6fPtdqaAmMHAPqC3LcKvgfUeM1FKo
	iVORJQAp+seqCiZsRjViUQBjLdkmWe6ZwYhKSlEJ7EdmyrBVd7JLfCQWjyKxeZBFkX6ZpMFXUHL
	4qT09tMK1QIyPpTdgNekT9506Bz2dhjYx8H+M+2PxpszWe/KNVJANWd7jcdNvh9Y=
X-Gm-Gg: AZuq6aKqIKaMFRBBxuFBW7OLZUhNrNQKhuPLONFRc8+WVvJXetml/HDUglLc242feTJ
	D2++BfvKOtDjQArZTOvYlOxiHu6+4+WxgdWDAmQ9zmGEjhJJw7Km3/6vM2OacQ7Gv+OWgYZ900O
	ghWW6IAiScPbOl3kkDw/KbfAhtKAWemNpVQUHriNwzdm5MRWc1kpJrW3keTYGYsSvsTYmCg/PBW
	PUIGoZAAT0neTqtq5HCEyijkuLnv4ObJU8Ex8wKA5u2EATf1kUienQVn59d2f65A3JvEt+e7JrR
	04eHm81qF2TKIjVdczQGip7yLYd9Zcyu68Y9d2sVDBQNxY7diHySYHpaxg4yQARZshU6niljDAa
	toE2OEQhWJZr9iNLj3QxLbsw+zj/Yzw==
X-Received: by 2002:a05:620a:171e:b0:8c7:13b8:8b55 with SMTP id af79cd13be357-8cb42412460mr1479044985a.46.1771314761547;
        Mon, 16 Feb 2026 23:52:41 -0800 (PST)
X-Received: by 2002:a05:620a:171e:b0:8c7:13b8:8b55 with SMTP id af79cd13be357-8cb42412460mr1479043085a.46.1771314761032;
        Mon, 16 Feb 2026 23:52:41 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac9d77sm29860229f8f.33.2026.02.16.23.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:52:40 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 09:52:23 +0200
Subject: [PATCH v4 3/6] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for
 Eliza
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-eliza-clocks-v4-3-5d09f28d4251@oss.qualcomm.com>
References: <20260217-eliza-clocks-v4-0-5d09f28d4251@oss.qualcomm.com>
In-Reply-To: <20260217-eliza-clocks-v4-0-5d09f28d4251@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=871;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=RKCYGsJFqEQSzos+9ejqQfu8ULxnCzq56BctAEfqjW4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBplB49QQnlb0qw1wGUJvCx0m/XPk5jwp8b9dPRN
 8/upQ3/mIOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZQePQAKCRAbX0TJAJUV
 Vi42D/9C82yRRnYnVLZBdbzrEdqD6mkCuKAyOuynWjTTRKAVEyAoivog70Ffk1L488gt4nP9E4z
 PEXTRo9F4J3Prcit0au2KkXuUpjG0xzWf5fcIA+vlxngQ0kGsDiLFuZWNfocO9s7yX5ahGiPjxV
 m7dIyeX7BgcMeEIPm2v+CVlWs3/yfM6bURBRUarD4P/6+Y1r8jtzakMKQazN4H1FJAT9bUx0M6/
 57jDkOvL7uNq1gO5xKMLoHzlKO/byly6DNWokzm6klWqK6UTysZoty0md5RiIbhEW5eO++NaBnw
 dtrdgIWtojglW/z9w6QeCo7q2ZeXZlszgE9t8JC3DNvGioJZM0gokKyjjocnpSkGu68izmbjkYC
 FSESYFblO6VrfTJCI0kA+AQHKrS4XD+YkGH30UT5FiDwNak2EXNzgBRzNx5mrf6paLV0tgfPfve
 QxOasgs9oswe4A3u/DKRhOn34xrJTaf4RR7TfSIbFrxALCPsAiTVNx2zQnhLneZu/iF30s6S7I5
 ZBuFqJpCde/QKB/F0vkJ1d1wmMdYZiEgnke1uRT0ufd3mwhArelx8IhiE8bzbsqbLTMlPaq8p8D
 oXfEUp3151rak6cVNTZtVaFr1MtlhSUbSBMdBKYZ4SaBUu75Czl1vJf3o0bqARSO900Eh7QUUO3
 rj1pM1HemvJPc1g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=eYAwvrEH c=1 sm=1 tr=0 ts=69941e4a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=PJhJesWDv2iQC9CHGcgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2NCBTYWx0ZWRfXyIY/lMblKhmq
 7C/gE0fS0I2kWclia/OdZyZjSZAJG0vEB1qsQzZaUloFsY1VMRjTg5UdbDf0SPtUgejNv2+QQra
 56Nakx56RQAWlHXcs8nBWe1954L0hYdKOa6an02G1BU/t9PcatCW20hlChQVrW/VfOXlpPkanC2
 tHxztyYuOSTnHqDJGTLF39IxrovXzvRZ/nt0oaMMdLh6m7tNOon0fyTGqkZ6hLysmenG/NVrRXh
 gMwBot1b6Yu1hyfp6hEEgMmZP06gK+6xA8HlRVdGisd85j0kR2l8fdjirJ58u81MZmOqhSdH14j
 zc/Wj5ihtOG7QXi1ns0NTMVboncCzZccGMQ6iuOokD+yQsZgy2x4g0A/O7Ko28YU75lZIFAF+K1
 IpW0AEYAX+DVIAd0XrtxtfNQ7OdTiD6EpJ4ct2D5TBwbItlcYofM+IHMxDDM9ycIkVZoDEYvTRd
 Ual4u0v6jfBBpVbp15g==
X-Proofpoint-GUID: G7rsvlxy6MTOgqglyXJO5e79b439Ovpv
X-Proofpoint-ORIG-GUID: G7rsvlxy6MTOgqglyXJO5e79b439Ovpv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170064

From: Taniya Das <taniya.das@oss.qualcomm.com>

Update the documentation for RPMH clock controller for Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 3f5f1336262e..9690169baa46 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-rpmh-clk
       - qcom,glymur-rpmh-clk
       - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk

-- 
2.48.1

