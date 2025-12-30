Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DA432B998
	for <linux-clk@vger.kernel.org>; Tue, 30 Dec 2025 17:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767116343; cv=none; b=fWINcBP76SEgR/Hwy//k/Q/rVkkyTaOESNzl9LkXOSk2yW5ZwcASMGG/JiqFmqbTwU9+7qTK72nDvRr5GrBRzgclPVO7S9SSWJHiPgU9JOyfG90qGWwboevBICIRXHT1+jY4AlEBp2hPbcf4xWS/jA1cU6RJpd/YhYy/8JFr/DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767116343; c=relaxed/simple;
	bh=ct1orlHuevH9HG/+pLvUirRHI2pkY03TYbZBiXIZqYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YtzAN+LtKw+D13AzFoNwXjCNZXG1UjwneDaNERe4CUVemSGndGbGqTRtrlKF1S7nrxcJlsBdud0OIlNQAJaZ87M8oiN6BLdEpbibnys0o2WpeNUY6zJ4S8Ld2zp/uw6lQrz+JxEVw0pgs+hd5nZoaw5AdkxQZspYh3nljWAucQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dUOLxKkb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i5trDnpQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dUOLxKkb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i5trDnpQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUE97LD3555938
	for <linux-clk@vger.kernel.org>; Tue, 30 Dec 2025 17:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0BpUds3aWQH6EBO3XZtfqQOdzwrf7ZAJB59/4giqyUU=; b=dUOLxKkb5KvSbG8V
	mRDFQTF7jUkrQe7e4bRJ6b9mXbSm1Zy9bDe9d59+A1dUcyK7SzbBSkl2sG5dApna
	exCekB4CKdKvBxCJy+9OKiegzRG9V0gzPn+lU8kJ3z8LxEoC8fDr468E7+ropbGH
	2OAlli1zdmmMq6cFgEu8x8GxAHUTruMw1Y0wb614hVoixN+0fgrUs6XhxHaXRozJ
	CmGhFC97PD9ea+bvURWQSwPS7s1I0gHQb3gMGK5CRkdjR1oPTpEYKxsVG21FCk/H
	soY9i6IDNABsUitrkGf/mUR1BRYgVHUCryCARcOzuOqHyr41lisLUnBefeLBFHnb
	HaDhDw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7461ush-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 30 Dec 2025 17:39:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b6b194cf71so19086641b3a.3
        for <linux-clk@vger.kernel.org>; Tue, 30 Dec 2025 09:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767116339; x=1767721139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0BpUds3aWQH6EBO3XZtfqQOdzwrf7ZAJB59/4giqyUU=;
        b=i5trDnpQBZalqlLdksZ4A/My6xS1hxNxtSOq4UU62RyBMEGbxaZnu9SscYWbvTkGqe
         FNIIAjFi63tiEtwYKjYwDAef0qrDhrDx3fyGtUCiGNSK7+7T5qAJ+PxgYjB2+WUatMKz
         CkWC3MX1cSsoT/wZKNiZaWy4/6fr2Jy6bvmCdX+cqS6Q/BIHZLJAA5/we1x4rRMS/IWL
         HSQ0ojyhyX93slsz/o4t3iNILJY4qwHLkPnRzubkdgmkOgnyMqku7+xThnOoiUlnZn7j
         PBTV/1bx5uRfQHjyp/Oz1sfR6wJ6xy5ctqRGGnXF/0SvNr7cJ2lUamob5RE2v6zR0GKl
         Mvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767116339; x=1767721139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0BpUds3aWQH6EBO3XZtfqQOdzwrf7ZAJB59/4giqyUU=;
        b=DPF/ZdBDFX9IlJgoeJ9zhrLCKXx8GI299e2iBHGd3BXUpZVE3xTMZ3NuUCAsdGXdcu
         N9anhyiQYp4I0MaKr9b7EZFlc1EqcPl37VnEWr8ADm1KdAJ2/6xchKJMp7zf39Fg8lk2
         +bgQQaCLRnX/Xn5vbs0MD1yaXEleRUptxJ3XDZmNR/G8BxxJJkmaeLLmVZgjBA9CvpML
         D163Djmsig/mVZkBSEnbr1u5wVg5ogC5Uw833oALFKRpualXJo1jw47fw9hcQOvWsKhr
         PyYBmd8WBzqQtXA+8G62YUVYFyVFl2VVnyjtc0S2QEqH3fMqio5Hj+hA7yytwPoOt6aM
         ns6A==
X-Forwarded-Encrypted: i=1; AJvYcCV2+ogVT15xc3GPOf4wM5NIqs2agTI95vFBkMcZkMz/pDO9btCK6tXoOEWYce+y2cvvGUn+4bh1kUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0kvH8uALRIAsR2nH6hUt7N/c9dD0sJGlds1oCg0wnQ3+VF8W7
	TCybGi1xZtdjR+saChMHqdRhbTwi8roxAP9OpwN/+xHDGeIhSyv3Tun1LK3GSmKy0ROm92Irjda
	3NkjtqFZLtCspOBehh/nWVyhZQTu5miQROQwYykO97Ncg/noJniceusS4oR9S51I=
X-Gm-Gg: AY/fxX6mIUZqATHXF0T/CL97DusNd9x704dDuFkaZQXMPcrBtBxhp7wbPx5/oy78vbX
	BRrp+SNWTZVkSu+M8OaHK1YZ2kllWlzsAQdeuWmohYuiixDDMxrXycVuU9IMRWk3UfCcdGjFPEk
	5M/G0KpNZ/v6nS1remn32urEVbvFoNla/O2F0N7sq6NaxOm3+Ip8/tUTT8eVN/ZQ8ovwSKjWOJ6
	1VkMc0cB+OiTtUdC5pfKVbS2QB9MPvvmQHWDK/eX+gpF40Jbf6yjed3EuLyMG6Yrh5h7sG/Z163
	OCk5H4NcgTRwMrpkpEvVKzrP+3tBIhM1SO9vRMrIJ3ZpC1J45jxubaYyDj4EfObID3n8vdwmV68
	5uWkKXW6Y4Ar9UwBb3Ex63k/TzOUHYdgZDw==
X-Received: by 2002:a05:6a00:414b:b0:7e8:4471:ae5a with SMTP id d2e1a72fcca58-7ff67456b8fmr32724935b3a.38.1767116339324;
        Tue, 30 Dec 2025 09:38:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEEmO0cWpUOJrtAy/PKVetRST5lKoFqF5dOeQsDS/mZMQ4Gq4b1Ue0MxB56JZ5LwZg9hUxtQ==
X-Received: by 2002:a05:6a00:414b:b0:7e8:4471:ae5a with SMTP id d2e1a72fcca58-7ff67456b8fmr32724921b3a.38.1767116338844;
        Tue, 30 Dec 2025 09:38:58 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7af35f37sm32865208b3a.18.2025.12.30.09.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 09:38:58 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 23:08:36 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: hamoa: Extend the gcc input clock
 list
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-ufs_symbol_clk-v1-3-47d46b24c087@oss.qualcomm.com>
References: <20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com>
In-Reply-To: <20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Do9bOW/+ c=1 sm=1 tr=0 ts=69540e34 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=us8TmX896EGkFYs_XRIA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 72e2fTnuC4Nz3v0TYR_U3NEart8ggZ5C
X-Proofpoint-ORIG-GUID: 72e2fTnuC4Nz3v0TYR_U3NEart8ggZ5C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE1OCBTYWx0ZWRfX9zU8eS2muSYY
 aipD49xUSFUPr22BSgSl3KV8/wjBbOv+WiBf5TJ5Q/gRDuxs2qmUpjFEZjwNgbZsVEb5wHVVwrE
 i7tdxwhTeisNW1qMH/NU96Lk9CHgsRqyz0WJUz9uc6OZpBNJyyTR/0SUUzefjHmjuTMG+zqF9fF
 QuBeYc4uKWz6493rgU+lQJZkQJEOJkh/nj+8hM6Aw5JdVToop0DMx0o/m0W3F8rz/n0+CehylL2
 eHNv9SVgA3LufZZBda68qzy/YaDY2XZY7P4Nl8v2j7WURRDeDPkMjjPcyaslFUTHx/L/HzNcjyq
 a3F8eK7srMOoSbq8zDDbaWGtsudgdcsVcx25VQ0IejPYcP1sy2HNG4XagS7mLlC8MmM9Qeq7y2t
 b3anUPpw5qoL3R1e5gtVIv8a5GN7JId8REYX/g3EVw+HgN90oLgNT3S0MeBa5j+AvAbrAM1SqGL
 Qu963hGPKCcsUfVdatQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300158

The recent dt-bindings were updated for the missing RX/TX symbol clocks
for UFS.

Extend the existing list to make sure the DT contains the expected
amount of 'clocks' entries.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index bb7c14d473c9c523e1501f9379ee7049c6287e96..21ab6ef61520695d977f9d741ce633cf537171ac 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -834,6 +834,9 @@ gcc: clock-controller@100000 {
 				 <0>,
 				 <0>,
 				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
 				 <0>;
 
 			power-domains = <&rpmhpd RPMHPD_CX>;

-- 
2.34.1

