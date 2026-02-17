Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B9F25B1CB
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 21:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771363273; cv=none; b=VmarimrS7xLa+bHp7Zz8f9W/Gf61gdMnZvxydY9ku41xYenkVfOhTtoBzf6VvAbOJy2VIAdNj2UkqxvDxZGFZ6CUORcxZDMXCIiCr1V1yhXJ+sGiLg8kWDworvKHuXJe31N9MBJPdrpZu9tVv/MOJnFdrckliZKyx24z5qtqjOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771363273; c=relaxed/simple;
	bh=uPEllq7cMVmmmCw5tbN1RWML31cynjFUJFUCxzJ7RnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oOhiEGx5ZO+VLhQn+dzCSLTPJ2FLHXC7DAk+JIem5pDX/Qye46K2VYim2gWkzzf2pIU/N8V6Ndnv2wqk0QDbgc3uKU+bYYIztN819lAV7Nsv8KS6BTxraswetzB0nYg1LSBtH1/y6LSpQA/TsG0wV5Yolt954snbFkr2HCIsCSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DQhuSNh/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1I/VqPL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DQhuSNh/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C1I/VqPL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HDk9sV2111674
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 21:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fpmqckZgEKJGk8NKQIsVxUre0hdZGqgxR0agHpg+ug0=; b=DQhuSNh/z5I1OEws
	UqWAQCVSHDeM1XG4NA+60Vu9SyeGqc25MnHph4/bYejeEE4BYRxghKvWfIXMtUm8
	sPMy00cHivrqVaexpj7aKCk8GLG7DNIPWfWDDfoOKRQ+pMPT+riNtX5wjLgmxuR+
	UXelnf4Tvg/hlR6y42qeVT59jDmJ0qjcR/6Q7g1YqZjhZ1JnQTqquLxCmzeqbUZL
	YaRD2cUqISBcXtWTds2EzN3Safg0fnPSREdfWyriKGDTsxWHzSRK2vAPQoHFiJtU
	XU/OeDgHxeMtSc84M5Oowuksqx4Vh1tovuzSMyOSxb5B1b+IVgdE1TZIiK/6d17j
	ryevog==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cchv4jr91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 21:21:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb42f56c4aso3128562985a.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 13:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771363271; x=1771968071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpmqckZgEKJGk8NKQIsVxUre0hdZGqgxR0agHpg+ug0=;
        b=C1I/VqPLK5qe+mm+KO3O6wuYjSSpnDZVGjs5TuioHj1xAyTgu8XUQZwKwtuhZFYMvY
         DTl4T1vefwmIYaHRyx/ORfNJGPx8hb6Xhjm1oX/HxeXGOVXRypJkolcJcTZVNXpSCoTx
         jLR5Go6y52RSjLkg6O4ILs37ydyIbJRSCjtMKsTsnexuxvuGczd7FjsPYjLmLsxrZo2y
         3B4LPqNeQ/ZALpyVr4nmtiK/BRUxeTjSNvx7OAtOmdhLBi7MG/qVl3WRilAvxFB+Sef3
         aK7AV0btVRQF5otG61JFVSCggq2FHOcyS987csvmKy1SRx6nSXydSDqvPtPa7QuCMM3n
         9ExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771363271; x=1771968071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fpmqckZgEKJGk8NKQIsVxUre0hdZGqgxR0agHpg+ug0=;
        b=iCPx8arKBLrAOc7i6/f3qfYLW7y6/DT5QkHrhrrVuwNa5PxMjSiF2NLvdhbZ/JMMdD
         f8gzZ8s8BF9PDrAPC6VK+BYjMvCxAXpienxnZdr+Oumu+KlLENKm3PEl6JSzlbNMGBRY
         ygGbaCJh2PUqTIwwPaaNVMnuXh0VpWBgBS7Jyi+YjycMwCa70JGvTRRR9bfiTqBd1AYa
         1OWoZp8rzrWkmFnqqnB1vX4+shy5Tf2sCtmUTo7b8aY26LBKR8ikJX+ZC4ixFm0zDi6k
         1Rq2slIqAh5U0FW9Gc3QKItju4LeYe7FJh5JQfeemCidbPXWJu0Ntf77wKWPB2gbM7FI
         QwbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx2B7QwRPZwV4tb3jOF2FG0h/3HmN+0m/Xu0oQ6XBpQ1RXmDGQP94RHut5ia7ZCpi9bFr2HpBbis0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl3s47QWSfHMS55jhWFeXpNk2y+Ku1aLGUy1pgf6aOFRJJUf6z
	dtwoBiEh6CEhCKeeidD1BxTrpROfS9JCfzc3NOrwkjmW2STeMxUlGR/bWcP9ZRoKJlTBSQZOoXi
	5Hsd4yfObGR4SPupVBw/sVuwprcNxpvknE9tufALfpjlIsJE5870Hrej0cMNz5GI=
X-Gm-Gg: AZuq6aIuExHW24vegAskgDaHWc7uPXzopfK9+2LiW8+Ti716OM6sH1hSuPx83+TnDzT
	8u6eAZw6++fdT8OukAJNl7RSSHAfpjH+fKk7kmnh5I7VsvRLejPyJxHsWeybKMLy/Zqb6s6EYHm
	LXm9OT4taxvjdhJxqpw2bd+l7aNbQB3SfC/CehQ+a/1LgsR4xeIal4NzVwYsC+zK20APf1MCojb
	JoQj0g4cvE7tnn7wsoMJ6FtRUJE+FltFeAwoe6Nxv3aXYBQT7AAgUvSaAacWccQTFBITkLr+Xrf
	LPlz23dkFgIp6qiA2RTrW85z4itxgIeX99DYe+j5PNfEFbcIImZ6rPelafU9YLOZPi6pcOmZ9Qf
	6sjU6K1CTHhbXfP7kWtYpSJx7f3fXK0C6Ef9Ls0bzLYndiDPapMsQOZN+33EQoaADl+VInsBW5p
	YtFL1lduj1PL9JpnhUK61wFcfV8bsakR8YLLY=
X-Received: by 2002:a05:620a:4554:b0:8cb:3f4c:eeb3 with SMTP id af79cd13be357-8cb42434f62mr1930152085a.41.1771363270872;
        Tue, 17 Feb 2026 13:21:10 -0800 (PST)
X-Received: by 2002:a05:620a:4554:b0:8cb:3f4c:eeb3 with SMTP id af79cd13be357-8cb42434f62mr1930149285a.41.1771363270407;
        Tue, 17 Feb 2026 13:21:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068923c3sm39293311fa.5.2026.02.17.13.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 13:21:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 23:20:44 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: sdm845: Add missing MDSS reset
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
In-Reply-To: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=897;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ftnh9MeC4gznLwDWHiWfXehLT1Bovg2FOqb//TUh/mw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBplNu6yvjN3Wh611iI8DgWA00A3KwkbaVYEIQuO
 HZeSxUw3c+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaZTbugAKCRCLPIo+Aiko
 1W+iB/44VezUbrXNMeJOWYyuFy8FsjZU10PkjRgYkdyZcRhnttXfMkqoChm1+ZWQHMcCDIGxGGH
 nEkHcqAmOFqnE2EdjRHsSZ2++Z9i81eQyAIUZ1l6jUTuoNUEipbkhk0HEEE4pyMwWtEZaDhQZeR
 h19hLYtqlVzKohBD+tFB5/t3s5NeX2XYwBfox+Anm1ITsOkcxPOPhhmuO3paD6vr0EmGg0PJiL2
 iM0OgbkcMhjbJdgpNliduYciuqtFRumht8Gx6CXw6Bya/A9zlCYTMU9N3m4amwN0MOExIBn9ClS
 uILeOVO1lGSUT2EQxJ2aqWowtg+d+3sArUBEQLQaBTtawAC6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=eYAwvrEH c=1 sm=1 tr=0 ts=6994dbc7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=aYr_IzhGWo5ApOnmw6YA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE3NSBTYWx0ZWRfX85EHCGs09VnS
 g3LKqeU2m18K9sTFIh1kW9B/wxZ6myaljrQuu98HuQwkOuj+g2/161FaVk00aPyVqA6mcuIM31o
 C5qNW4Bew36EmOat03c9t3drBZVaooyazf52phxqZLYgwNfhhgx/8veo/wmCBFmWuxoHxtirjYy
 McXnmXsPcKzmLvDOVyETA3vytyY3xhSt//xRPOf/xbQroFLnUaNdSZrbO1O0U5Y//TpwN5AlEmd
 b6j0ghu7FCrMwy2hW6QWJe3WQtxjf5MCNRrZ6IXgQfKJCL8JMo39Vx2Kz9mK8NwP8zESSbC+tiK
 CUOf7eGgKHqZ2TJqIQjPhCBX7IjsylpcvpUYZhVFPA46ZzoIF3uFtgwQFW1dSlMRz83LFT9abFz
 GqndnXThJ/JFNTH9F7pyIFOpa69fJMlkWXWr4vASNSJb6lxDE6KohF7+939wGHY0j+w6mYe6cTg
 sac72JJWamVFA7IaVAA==
X-Proofpoint-GUID: GnYLGS4hI3mLNlYg5ScnpV_8S6p6cWpJ
X-Proofpoint-ORIG-GUID: GnYLGS4hI3mLNlYg5ScnpV_8S6p6cWpJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170175

From: David Heidelberg <david@ixit.cz>

If the OS does not support recovering the state left by the
bootloader it needs a way to reset display hardware, so that it can
start from a clean state. Add a reference to the relevant reset.

Signed-off-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index bf2f9c04adba..75c192eddc57 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4550,6 +4550,7 @@ mdss: display-subsystem@ae00000 {
 			reg-names = "mdss";
 
 			power-domains = <&dispcc MDSS_GDSC>;
+			resets = <&dispcc DISP_CC_MDSS_RSCC_BCR>;
 
 			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;

-- 
2.47.3

