Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5F35012AB
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 13:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417294; cv=none; b=FX4swlrJflSUxp/NptdUD+8bwxb0pvAAAA/jbTIMkk0bGTIzcrM2hF8X8tb3aKAuybrCxqSMYFtiVouApEOae2NG53Og9YLeohwTl6v6cRkfVF1Kzy6n38dsSi3lXQm3f8RqJeBP70AxrzMKPJ4fWZScng6gdDu8OKrAgx2+QAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417294; c=relaxed/simple;
	bh=tQn4IpcAQWTKRnzN3rSl5tamncU45CIHNxzgTC015xk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZzAeZBjE8g04+1ctbmLwE11CdHIXZXkRDIgFpu0qAJ/rt9Z6+Wv5iY7PKBEQJUaN3ZCU4jkW9ChwaHyByF9X8sxIgDgeYWWtuF3SAYjJj6IP4dHBV4NSmTVAUI9oXxDhIZrmPqh7yf2htgNQx2/6vd8k65WaobvNtq5dg9+X5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XsA7yYFj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=da3nBzdU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XsA7yYFj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="da3nBzdU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P10i2042000
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 13:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YeZt34r7XG1MrZbmlAFe/De4GqSWYwKCCqETP6sgsa8=; b=XsA7yYFjKq4hLyuC
	7CvQIKPYkvstSq9QHpuIvikHPMDjrilI0s8RdksEVRIFvU+mGMLre6ald4AvL6cl
	4vBbHZ/lw5vF7IROeeJs5frHy+sqWaWZn29ss3syRVe3o1nXq3kDBkSMWli8ZyEG
	r6eOfp8B83JWqmSf8Hm6I0NfHzEBR/w8p9qrVchfGYfNls2Vfy+sxvoptC81k60N
	aCpgsEc44K1iP2DCOuDLGos7ZLWdkcJ5vOhA01cPBXMrv9r63fW1AWdEQhmMHauL
	9Ve+f4beMBQW6Zcq9Rx9pWwo7FzN9upRMFt6Ffh/gZsd5ixjT2TwcUdeU5vt3Oo9
	OUySfg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur2y4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 13:41:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f13c143c8so403285085a.3
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 06:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417291; x=1793022091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YeZt34r7XG1MrZbmlAFe/De4GqSWYwKCCqETP6sgsa8=;
        b=da3nBzdUMJUo+ftIGYBaqQIc1EO+fcNq+mOowmjy7MHShFKZxg8Kj0WQHwWXOSm9Cz
         BIX9S3yaD7YnPRcN8ZFGEGcRgYKPpAohhAbOrtQxjGCYcqMfOv5K8sXQP5AduTVsc53O
         WfiRd9Ds1qiP4KdHyqoPZZspvxKgO4dcTQAxLIereHzM7OrPF7Pp7vTmv/3UdHqXgGNp
         Ff1ht5h0msqUf0xSih8v7WvlwYAsZQqV9Db7dFXYOSS5SjWj1dAmvtAnsup4phcLXUis
         0azZurgQvsnB0xCZMgZ9p9MKol4aO+zGgX/7UEEnbxY4cZp7TOy3wJKbPLQIP9jSn9cI
         bBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417291; x=1793022091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YeZt34r7XG1MrZbmlAFe/De4GqSWYwKCCqETP6sgsa8=;
        b=NFqdjHbmXnOHgTJg0K5v/lhkUNitiSuKQeOGwoallKh5GCBjr9BJuWwRrA13eLIrLP
         VCuzIkBJRBIQkdpUG908LtOhUIJHWch3fdxwuB7mD0e443ZCYYtmdeQWzKh3Jq5nUBFc
         zrNfePW1Z4hw4+gBOxNCytJarP0N3sOtFLHkWR6W09oSoDpc346XpTRN/tkAo0iTxDZ+
         fEukW2PTfEG2s1r20GgZPTEudLiyUq28D+yNvjsvdcIEZx4bN9pInABD09lYG0u+Vour
         NPqd6274EpY0ZfD0ILpvmZiqkY0P6UQPuQU1+CGTW+X9bcXPOXzGtCi6noaAA2zTYkBp
         NwTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcv0y2ixs/6WAfo97c580yMY8BMFH/hf7OVswmrJykDEBmOIOH7vvSkRPoOj5te0MzVryACy5WEog=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUF/Sk/f1EeRJ/+e1797VukBBFl44MLSwovE3+hteF6UqAWbI3
	IF2kIQ9n2wvIfBm78LOY6ImH0aK4vxMmt+1HgdccF3Sway9YuC9jzPp+c+d8fFgCweabjkGWcfW
	dChS/9UGILL/HDZXVFmdxaHDbklssKlR9OfOpHv7eirbsc7WeLN3H6HLiphnsiis=
X-Gm-Gg: AYBFou1zpAwczhIvDe6RxfDWl/9rfwEe+nSJ2HbFIdzYt+rakpP1F3DjTm0iYBjmUl6
	ICmVk1GFXiLXn6yvYnYaLX0tG2e6ZNizoJ9QL2w8kjmh7ZD0qIqSxDDufkcp/qKOCIBhwFHMTdh
	UPHq5AD3YpqWgJv2s0ZMVsSMPqPS2HwSE7+4GF5shw65je6Y374zrCe0airXCRQtPSIwC5qiOVv
	2OByTvK/Y2tt7U7ky0LhySPfAmIHNOcgs1kIzWtXaJUUxdXFeXvK2Oitwu+Y3Xj8upaqWYcWkBW
	2mgs2Ekwe/PzvPEIZmKlqImo8xF39gDrQ+hUqKbwVyY0wyjDJXNlrs/AqIHFBtdEXSOjQnZfXno
	+EcfOs9AcJLQdzfS3dQe/pGmy3Varv1c6w5Tynxo+RByzVFXzwuYj1PgqKjKtLccH14euGHi+ze
	KVROslMVhZJxdY
X-Received: by 2002:a05:620a:3711:b0:939:733d:cbe0 with SMTP id af79cd13be357-93f29b48f16mr1277410285a.3.1792417290706;
        Mon, 19 Oct 2026 06:41:30 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:939:733d:cbe0 with SMTP id af79cd13be357-93f29b48f16mr1277401985a.3.1792417290116;
        Mon, 19 Oct 2026 06:41:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab473d06easm4409851fa.31.2026.10.19.06.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:41:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:41:08 +0300
Subject: [PATCH 09/10] clk: qcom: cpu-8996: program the MSM8996 Pro droop
 code register
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-fix-clocks-v1-9-370949e4d8a0@oss.qualcomm.com>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1907;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tQn4IpcAQWTKRnzN3rSl5tamncU45CIHNxzgTC015xk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1h3zmd9/rpIC7E5vdNxjayC4hJDiHYczYV/Pu
 0KRYxNHGruJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYd8wAKCRCLPIo+Aiko
 1VNmB/9TDsrqG3/HLtEJoBo+Fm4nbHGNFd0pZdklwHQj7pNjpgowGgKEDa0BH+UlcgwYaVHLjv3
 vS92nxWeED50QIx4+8rlbqUkKKI8N+f0fzBHvdvtOi94qiH6+2HfmKMix+b3GPKmZt4SXFwL3sm
 qNtpWu9olVycpgmhyW28QKTNCJ2ykPiAto/7U+wMI6quZzG0Cg9fvknP1LSvveJDwo8pIJGGA8w
 4D4Q/N4OccglSinz7KWoXwRjFLgg/1HqR3FMz8OCyjKPd63mJU3lYXKhci3qIVSPTBPYg2F5S0a
 mLv75aXCdmLSRlHh8Sc8yOoMaorYU5F0SHWGzLQ/qvqjeHO/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX24EC34RRIRR9
 zq4SXTfmrMPCoV/S28iV2uS9ROHp5kL+Zq8+BF+0TuZ4GsgGzyzlw7jys7UbTjZziukrnzSeK0/
 dj4eYDGBwpMT/WPCsx1967VEDYysYT8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX3udE25wGEBeD
 h835AGBbodLiH7JSUeutdkIgSGSAve92wjXo3e2bJ3tWQCvlMAbra5MMo6h786GbV3YsNCqFko8
 /4NpTxvuQZYHqYqQaXNiwhF/yTH2LynJehF4bh5G9AVtgDoehs8YwgzowYhOF8c69nfPhJ9wVD3
 lhNRLRA/jfpJMTHErplPqc14aa2g4S62nA2o6WC7wHiraczx6djjobDDShKpb+/boZUJZkwf86H
 TLkc+JMZn8PQrid7u9N8yLH0wjNGPI0UPwvRr0NzOnmVEaXSwoMe4JtIaO8NKxBnoj5WRZDFXKZ
 m2++VqYkd/UovZqzP4RbUK0Gtop2zITQr5XZJrpEdmHEPBZadXOyaYqHn+kHlQWup1Ogaao5kKg
 d2KdHBqzAGsHqA3tLQ7GdGkjn0UNElvSO3WrWYCshqNGBcA5YkwuMadu2pVxFgO4HRWyflQFqNZ
 FVRKf2RxIDcwvXyhrHQ==
X-Proofpoint-ORIG-GUID: fT6_4TdbPyWW9BQFDOD1S_EdHQpRlE6N
X-Proofpoint-GUID: fT6_4TdbPyWW9BQFDOD1S_EdHQpRlE6N
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad61e0b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=U9F8TDeUCpLtky9u47sA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190054

When the vendor kernel enables ACD on MSM8996 Pro, it also programs the
MDD droop code register of both clusters, so that they switch to the
always-on clock source when entering the D2-D5 low power states and
gate the limits management clock while asleep. This driver enables ACD
on MSM8996 Pro as well, but leaves the register at its reset value.

Program it on MSM8996 Pro before the clusters switch to the ACD leg.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-cpu-8996.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index f22dd80919fa..d428043ecbee 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -56,6 +56,7 @@
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <soc/qcom/kryo-l2-accessors.h>
@@ -80,6 +81,7 @@ enum _pmux_input {
 #define MUX_OFFSET	0x40
 #define CLK_CTL_OFFSET 0x44
 #define CLK_CTL_AUTO_CLK_SEL BIT(8)
+#define MDD_DROOP_CODE_OFFSET	0x7c
 #define ALT_PLL_OFFSET	0x100
 #define SSSCTL_OFFSET 0x160
 #define PSCTL_OFFSET 0x164
@@ -471,6 +473,15 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 	/* Ensure write goes through before muxes are switched */
 	udelay(5);
 
+	if (of_device_is_compatible(dev->of_node, "qcom,msm8996pro-apcc")) {
+		/*
+		 * Switch to the always-on source on D2-D5 entry and gate the
+		 * limits management clock in sleep.
+		 */
+		regmap_write(regmap, PWRCL_REG_OFFSET + MDD_DROOP_CODE_OFFSET, 0x3);
+		regmap_write(regmap, PERFCL_REG_OFFSET + MDD_DROOP_CODE_OFFSET, 0x3);
+	}
+
 	qcom_cpu_clk_msm8996_acd_init(regmap);
 
 	/* Pulse swallower and soft-start settings */

-- 
2.47.3

