Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550530;
	b=ESYfiY7hPZ+DlUQMTwxQvBMIW2wG9CtSfl8tUmmZacEL2N/TIC172Gi+5SKUCM5kcGrL
	 M7C0vT3VhAbfw+3+/rlM4oC80KU08z4qHxrW6qe7hGUb0sN61CL3yAw5dorpTP3rjGDBV
	 yCOkMk2Snn/Z3e6Zq3LrKDU19scKIGuQlB7xbd2cc1q4B1M+MSy/d5/8fL0oFsNQ5Q45/
	 LBRLrAfVwL2wcGUwj5egMiND/6zoSJ41ekKgxFo6k7/EyRKPnFDeQl+cAZQWYkDOk65s8
	 GXkg4jfLO5F9M2cP5zlrutsbv2TCtIdqXLgqxsMKpsoUZlwExKlCNMVo0FAejgwR2xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550530;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gJfJUHH9e+1diTv6/vuCeW7kuhaG0Mf+QFLudhQqmoU=;
	b=aOdAg7RdlNSsCfmGpnjd6rGh8LKPppfKR5pSDd91WNOorQbOwuaaJtfJIlKaHxw70W0u
	 ShiHiKrc5zw+5C/bt3oNzRLUqvvrW1M2JxBXyQ1w7eJVpQGpq2+bEa3hZiH5tYYEhXOye
	 L8/LboapfzbayBCKBeBN7rSylzblyOZAq+05X7I6UBg80K+QVYCm0xzSaeKBL4S3M2JCR
	 ckIwx0dx5K3YuG+VZ32Xnofs3BNI2MVr1/tPBJawIXO6ihlVfBnLkMcRHG7HSBtqvkcto
	 jZ0DCDMP4yO+Hgfwm1fB9s8K2UqJafOSW+ATUqzbp6wa4c8Oj4k0H9uudHuWsh1x6LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ijRyg/7u";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7CUASpR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC42606A333
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CC42606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ijRyg/7u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7CUASpR
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXGTG3000189
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gJfJUHH9e+1diTv6/vuCeW7kuhaG0Mf+QFLudhQqmoU=; b=ijRyg/7uiy425nk6
	xxkriXE7jaF7PKGKzLo8R5zD/gKCqdT8L9upLh5FG/xciI+yp6LVEYYjBjMtg50p
	3NMH65vBbw8802dNc7KEML3DV1WVnlzqR+7nsy5J3EccB5T1L4sOxI01vptmiSep
	emKrQC+RgJ8LqFOg3uXB1rNrOWKulpjXyjnovyXYVFarQ8jSAa0/9/Zn+NBKSzuo
	+UxFZ5/gRNKwRQqqOOhRJKKieaQa7g3ikkQE7sJfsScjhmD65/vVODmVvcR4mp3o
	pnUmCAtor+bmy15nsqRXPJ6gNK6e8HhaVI06bXp4uO+wPtfoNfCGDyazclWVKymu
	kQ/6+Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5f00gmr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94965dfec53so58234485a.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 12:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550528; x=1796155328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJfJUHH9e+1diTv6/vuCeW7kuhaG0Mf+QFLudhQqmoU=;
        b=R7CUASpRH1XGejr7cB9imMgtuChrdAZjOQlEd24mf9EZ0sNzJ5gQZ1b7DKfVIJVEcv
         40k9U/aVupRB4kDlCu983H94jFnDpAvp8kwv9HJIyMDA07H5Q+Le4jfwc9LmtDPGFyO+
         dJspuWPOBDloCEcZNCNm5jKnjh8YnT2JnlYoAGy5AlRv0LitYYxCNSVHKI4tBAzSkI8V
         cNwWh8oCDdv4Uwe4r1QkRlucjfwERGqVGDUhyMcPkBeAWdf1ZuMZsL2wELpit5anmHxN
         GzAI2LDVDu6lNl61qOpXgbrRkSXnMdtwXXAtHHAtThQmwvWMWuBGnE3VlXH7vVGfLbhv
         mVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550528; x=1796155328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJfJUHH9e+1diTv6/vuCeW7kuhaG0Mf+QFLudhQqmoU=;
        b=E93fihBRHMuGDRqULS2fZ4KywVsZequvEdZtVEm1Aai8aS16DXpWJ6gafQzsA6BtM6
         JrB8YTsNxkx04s2j6F1IZbX7sPTi4K570AZUYTyOl/drUPkCnW584B4eFQeq7GnValTl
         qH7yualMzU9DdT8uTZF+yvIn30fz/k+NjwyfPrZIM9M6Ho5qdXjwTjG1EX+BZ5kW21qv
         NepfsyQeIKEUGQHZcT9p0eJ95BWnXSZkjod8HR/r9zNJ1mAPPLKotTisqKzLlbAda4Yl
         Mibc930Md6H+U0KtuL7EDdxeiz7WIKE4EYuWskPQVg+qr75+FcVMsI1+6ebMBzYQOCXV
         NBkA==
X-Forwarded-Encrypted: i=1; AL+hErHyWQKLoLRhIipjGOrhT712CJlLOoyvmj/3VpNXTBlb7e97n3aKEeetdW7UmZVSSFhWyOHA05O+i4Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GErqeElr4XpPGIEBnMPs2Yv4pN2YaikQIjnLyexzbQqTk6Se3
	gJeLGBkcC0GVzfCOgWxPYn09ubPNqDWdBDekXMcpQwGhS1Ph4+yjNvpMIRu+BV8pLPmqKzdz+du
	Xo/YIxJJQfbhwvuMrhRx7QbripwfeimmMUvjADh5pRU1MzwhPg6G4DJUTWIZ86uU=
X-Gm-Gg: AZFdTZeT92mP8/IUdbPZ1N8ke396virfAe8tSFZBukAO/03Ab2SyzegkHNuUB12hz+v
	TCXL4jgGXo4/d2n2t/s3nW1nfdXG07AnvrxCu59ayO60M3kjbtYbVCY6asr/BAtDZcoT7og6GAM
	V7YbtNfVqhqVdBGkmsD+cAJ/Aapp+v/4LBFX5H5JYWwl/JRXR3/KtdHgHgTDvkPxZEKfpQrzqBz
	KtmcxWx/NsaNR4i80uRFwG0oWlGT6nk80+2LLldioTFGEeJClgxK/miO8XZt2xYSMekm3rVMXLB
	HhxuBVFoR0uDgqOlCPWvwz43oj6vgDwCx7d9EwVG7x/YC4FCmx2ihztBvucXYTyEf/KVqwmNTG1
	qHIpIT4rfu/kLQ0ZxRXFLL3rF4tH1CwneUEo3zQ4H00rEWpKvq+duY8tKO46wHWjy4vaK+b7qm+
	xee5w/pd4=
X-Received: by 2002:a05:620a:a8cc:10b0:939:8148:1e3d with SMTP id af79cd13be357-949ba891b7emr2492984585a.2.1795550528163;
        Tue, 24 Nov 2026 12:02:08 -0800 (PST)
X-Received: by 2002:a05:620a:a8cc:10b0:939:8148:1e3d with SMTP id af79cd13be357-949ba891b7emr2492979185a.2.1795550527583;
        Tue, 24 Nov 2026 12:02:07 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:06 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:38 +0100
Subject: [PATCH RFC DNM 09/15] thunderbolt: nhi: Resume the domain if the
 NHI suspend op fails
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-9-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=2000;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=VkyXd0QiiEQncfW+Bjx7hTZQ7/bCBvoRe1dG6P5u4+g=;
 b=w4xeWydBj5adKKUqB+y+5tcwfjeukaRXas/yGtt4/eWlBLJ0+XyjsG0TEgr+nRQgr/2bi+iTD
 lWRKVcz/oOXDJ7Uyl0lDZjLWx4f3oivC7cVJnV6F8m77tjvMrYmjYIe
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-ORIG-GUID: VF2Im4QUjuJpriiEc2Mf61JLEX8VHO1b
X-Proofpoint-GUID: VF2Im4QUjuJpriiEc2Mf61JLEX8VHO1b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX/f8OPt5gR48+
 V+ghNQPoqNqYZSRf81neHobGyKuqUTiVNa/nRjY07Y0T5aRc323zjCRWKhLye0wzpNe/02a+S+u
 LYXBMUxRnNY+yymuLJ+9R7/Ghr5yMPo=
X-Authority-Analysis: v=2.4 cv=JqtkP84C c=1 sm=1 tr=0 ts=6b05ed41 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=kCfvZJGldO2mi53t-5YA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX8OpJ1EXRW+En
 /u2+kXKLlakckZ9WUNiFBWvkCWS0LNrXCe6CdBAQR201tFyD8QB35bjz7g3KE7ak0siOtRbvagW
 hE7PoOTQJySz6pRsG4CMVVE3pJS4AqoY4sprdyIWjxAv98ZUP5m+GpN8zJFVHeTl3t9kbuDuq/f
 +CFd4S/ScNp7YRDXpczquB6FCnEl4GD1d58qQkAprCzLTG/9FlQ6rekgxw2VbhAwRdnk1F7sEW0
 /9ZOaHtjZEXv6CoKREAm9M8j0yLSH+YdSrGXsXs28YkCB0hgDEssZkFF8L6kgLKd97BsM4Mok3q
 DS0AAq5J29AK9559UedI/9oEuNYsSRSZHKQGNIz2/TPI+pmwPqZjpeieEJbbU3It583+dXrWQt0
 QapM8ypqndZGxrJWEFNGQH/FUNuiSnBLVmDHRSPIUvEszQDKhgC8JO+iKghJ1mcOuJIeev57pdC
 ofOuSBApRDdxvMRJT+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240078

nhi_suspend_noirq() and nhi_runtime_suspend() suspend the domain first
and then call the NHI specific suspend op. If that op fails, the error
is returned with the domain still suspended. The control channel is
stopped and the switches are marked as suspended, but the PM core
treats the device as active: it does not call resume_noirq for a device
whose suspend_noirq failed, nor runtime_resume after a failed
runtime_suspend. Nothing ever resumes the domain. Hotplug and config
space accesses stop working, and the next runtime suspend attempt
suspends an already suspended domain.

This happens on Qualcomm USB4 routers whenever the router firmware does
not acknowledge the sleep request in time. The op then returns -EBUSY
with the router still up.

Resume the domain before returning the error.
---
 drivers/thunderbolt/nhi.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index bcc2b959e3b1a6b014c13a4938ed6f68cb0d0fd8..e2578740d569a7ee1d5ab22e8effc153cb7d4632 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1177,8 +1177,15 @@ static int __nhi_suspend_noirq(struct device *dev, bool wakeup)
 
 	if (nhi->ops->suspend_noirq) {
 		ret = nhi->ops->suspend_noirq(tb->nhi, wakeup);
-		if (ret)
+		if (ret) {
+			/*
+			 * The PM core does not call resume_noirq for a
+			 * device whose suspend_noirq failed, so resume
+			 * the domain here.
+			 */
+			tb_domain_resume_noirq(tb);
 			return ret;
+		}
 	}
 
 	return 0;
@@ -1281,8 +1288,14 @@ static int nhi_runtime_suspend(struct device *dev)
 
 	if (nhi->ops->runtime_suspend) {
 		ret = nhi->ops->runtime_suspend(tb->nhi);
-		if (ret)
+		if (ret) {
+			/*
+			 * The PM core does not call runtime_resume after a
+			 * failed runtime_suspend, so resume the domain here.
+			 */
+			tb_domain_runtime_resume(tb);
 			return ret;
+		}
 	}
 	return 0;
 }

-- 
2.55.0

