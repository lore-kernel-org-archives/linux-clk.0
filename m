Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C08B442FCD
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 03:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788234829; cv=none; b=YP3j4352jIhYeEfy8hlInyZbEKcjvlqH6Qe2n10gn5164GsSYApoU9WE53ksTZ/ZRGmPUVIrfIvh7gPKzQr4jC8QD/cARtJcEIecuRxEa9O8aOmSGN4KtC4dRyWtyYqNgvom4mFN8jN30cBwNU+0l+PIhB71Go9D/69EXXxIbJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788234829; c=relaxed/simple;
	bh=F4SvYOQlyCKUGia87A34XS8D5c9Kum0774nQtePXGYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CGqO/ENo+5e68O4S5wLcq2mlyLzptFjWQbL2MveTzQGUmpvvq6VbJOMQyC2EuMvy+r1FO6Tomdz0g+QfP+2wDyWm4hqKsLZ/XDMdKtmE7dKpbQfZTTo375fFz50USmJY2iUSqCeAQeFK3TA7SxTEPKyYYyt2QlmNx4zqQQkpy2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XhXZQx1a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BYJ8ZND0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XhXZQx1a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BYJ8ZND0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68123Jih535413
	for <linux-clk@vger.kernel.org>; Tue, 1 Sep 2026 03:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Nz7mNSdJ3om
	7cMlWEfSsfwgFcE4ZNET7S9/6Z47Vwkk=; b=XhXZQx1as79DFt7/YYreUa9NxyZ
	FCziEo3iZz4hQf4cUWy0NJRo13H3qU4PT7yhJ+vQP5NUZdHpF6V64lZD/xC508zA
	cuJz8U8I0hXKMPnirGJQ2xPMtDNGQyCk0df0H99V6gYdQcblacxauYeQuixqnkeE
	yFGikRM2TGx3lcLu0Ict3TDlDJBj9DL2T4MKbUF04u8coAM7Ijlis1lb56jcoN96
	jRr4m8498eBSXnNJWUMsxx2/xwpzj+gf46DhEeORgc9vQYn+npAEKaOn1bc/5qgN
	mUyMXdQZtJGxlRNnFxX3AWmtq8fZ4phsrErSP59D1wwj86PHszof6S4/Pyw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8rc0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 03:53:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d9336581a2so26965595ad.3
        for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 20:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788234828; x=1788839628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nz7mNSdJ3om7cMlWEfSsfwgFcE4ZNET7S9/6Z47Vwkk=;
        b=BYJ8ZND04hMs5hSvr5/qhPIhR15taoJX1/mH9UyKus4tFboJMHTW9xS/NG+AdR8lKm
         R7fhNFfwPHy4LL96sFN1HHVVZu8w+Axpuiqk+nEoTnxEGEQ5b80Jlxx2Ynd0jWXky8Jb
         xUt+g6PjwG0Eli5pSowOsJ0fY0UecmCUF7X/lg6/OxhwdZjBprI1Pr10eIguiWagjVCS
         34B7qyMKwrt3se2SFvzTxCaJoHma8EZz9VlIN/MiMJ3WFOmXSIwjbJHAkEI4yb8pElhZ
         WV12HHnSbnYqMeaWEQ3C+NiMgcrhRIOlB2JKmaGvUt36QYD9C2yWJ1a7q9H46w2KNcVN
         neVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788234828; x=1788839628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nz7mNSdJ3om7cMlWEfSsfwgFcE4ZNET7S9/6Z47Vwkk=;
        b=YDZxiW6cii9GwLyVxPwExX9Xka0em/3vdm8kG+bjvpDJXnYhKU9CxyNUMYY+MROd3n
         wsLVmcNSjMt0rCUUkkFzoJmvG0C/GIuPmoCf7pnZlgJB3J3GFHSkWMwQNd3TBywlA+GB
         qj3QbaLecmtvk1Mm7WvS/a/qcc2uXjKFXqSCcKcjUz2ra0mplz8kfcvhrYbfYXccWDxp
         q3mV/zYKdsho3B2cEyxlCyUlVD44sr2YJh9zAYrsrlI03ZPCY4eyhXw/2HuhKM7kr00s
         BqBiB8FCNGd0TBnqeZYNsJbkLX3rh3penHPLDOaX0eLq8e7K6zUjBtGC5WMk1/R+cXyb
         dk9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzag0JhOJuZWinG8jpTbO2CsFNNMantr9MvxxwnxisZs7eovXzYlEoljhkoYlvVbwbvSom6bNBCA4o=@vger.kernel.org
X-Gm-Message-State: AFuF++lydUbNNbWkRBDrFeilzXwl4IDIukLvB57Z+l0fv8bEsBwWD6uq
	V+klvDKNSGfIeFUCu6PrgjCK3H+rjowa5vIWYol8S5qrUd392cWbbZMXeGJdfb1BI9i5mkPCYXF
	96RaSl+SGa2Jm2HGwD0jLY4NWkCyVNL+nIkHRRQ1qDpMGFxwCv3TQCfbIW9oS+7s=
X-Gm-Gg: AYBFou0jEQAKBs3zfJNRuugYTiZvRH1bGMkz5ZxC5Zd4/tfpFDn+z7UHfPb2BmDCFM1
	CpNrTkCyh7A+HBZcSVaGaD4Pq5xBkWZXwvS+CMaw4m2pYfare2qEjZmqe6SQbwsLsUcj9YDCmbT
	UylZGPi3tzs3U+vsqEkdDCuKBC4R7eW5txP30/hq2DuWu0ObUfZjmu9ULd7Pr3LzpDE6sTHzDWd
	0bZMb1pMH5ziYSO0g0u5b9XIoLYWeT7o8SNGIo+DkEaCz6z9EKi2My7sSnshCjUXcohmSOXxkrj
	Eg42Z9YlZSGdwosRNg9tnbz2gukfe7LgfGxfjtgrkrsxJnnMuqHbEOdxwsCKtVzu2TpVHXI3oj4
	SINO7QDncVpbwGVXhbC6H7AJjg0HPTvCdNbQRneoplWyok9n9mfRfA2BuOUAN
X-Received: by 2002:a17:903:40c5:b0:2d8:d4ce:7e3a with SMTP id d9443c01a7336-2d8e2e5f427mr330684675ad.15.1788234827586;
        Mon, 31 Aug 2026 20:53:47 -0700 (PDT)
X-Received: by 2002:a17:903:40c5:b0:2d8:d4ce:7e3a with SMTP id d9443c01a7336-2d8e2e5f427mr330684025ad.15.1788234827190;
        Mon, 31 Aug 2026 20:53:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm16702035eec.1.2026.08.31.20.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 20:53:46 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/2] clk: qcom: negcc-nord: Add the secondary QUSB2 PHY reset
Date: Tue,  1 Sep 2026 11:53:22 +0800
Message-ID: <20260901035322.654-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901035322.654-1-shengchao.guo@oss.qualcomm.com>
References: <20260901035322.654-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a964c4c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=MJwEArL1UJALDHajFQsA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAzMSBTYWx0ZWRfXx6Qk7LEeyGHF
 y41BZM+rVD6lLbrs2RKTo2c5K1hzygX/wHxfzNI1OlQ5B3VTaikVG37/bUHItlKXk2KE1117AY7
 clKRu5VIg61KNfw/BkqdwEwFvIeQE+Mn2CKf9uhzSXgGbUGwlpsxTxgB1Y9KfpvcAKMWgOgA/28
 vKKu8aU+iOWLY0WPSzsw7TviM3z7NQf/b6q6oxNCQUwxG1JO9oGDfxF3m/epRlMnfF+CyO1mZ3Y
 iOHYX2gDU4yQZp7a5Vs7u4UdzXdiGOU3/o4LCfHix8VjV3y17U8CHvE2bdrMfzF5APJquNTnBcY
 KVqHwFsPUggGTsA+NM2Fvua38abK2aPc9ZLayrFhM+V8w+NT3McUw8npyOMI1hyqasT643a/iAh
 LO3EbcSEKMYP07MFAVks5UsCecI46cLq5PPA+bjLO8ht+vTLM9BlVyNlhYevziz5gWDzpQ5hJPB
 a166xgMdy/nHNSiXcog==
X-Proofpoint-ORIG-GUID: lANA8DNUs-tA3qqru7z--JpGbq6EtUEi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAzMSBTYWx0ZWRfXzoT29ftXRQup
 9p4zhl9ZcJ/sh/0HLgEkxw+G3raJ4a8m5ECFc5rva4Q3e6mZJC+s/Pd1686bKwSgHs1plDcjCpG
 4xJX5TkIeXSoaHbJ71LvVm2RqsPSlvk=
X-Proofpoint-GUID: lANA8DNUs-tA3qqru7z--JpGbq6EtUEi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010031

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add the secondary USB2 PHY reset which is needed by usb_1_hsphy
enabling on Nord platform.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/clk/qcom/negcc-nord.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 0db284edc4e4..896050291af0 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -1877,6 +1877,7 @@ static const struct qcom_reset_map ne_gcc_nord_resets[] = {
 	[NE_GCC_USB3PHY_PHY_PRIM_BCR] = { 0x2b004 },
 	[NE_GCC_USB3PHY_PHY_SEC_BCR] = { 0x2d004 },
 	[NE_GCC_QUSB2PHY_PRIM_BCR] = { 0x2e000 },
+	[NE_GCC_QUSB2PHY_SEC_BCR] = { 0x2f000 },
 };
 
 static const struct clk_rcg_dfs_data ne_gcc_nord_dfs_clocks[] = {
-- 
2.43.0

