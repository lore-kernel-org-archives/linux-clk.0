Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1725361DCB
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 19:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970299; cv=none; b=QtoeIUHG8kCF8VvI7Hhu1vXFaIAFBJhU79qNVTH4H+3f5ZvU3FVFYC8w79RtY7arWCm0AzKvonlp2SGwCh23rdTtc2ppYRZMOtAFS0HAapydb+CMzqXnoRE3zzHQH5dceA2sPNhq2L/0SeZAuZ/qkXwy7Hwt7irsuXOVOo9/wJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970299; c=relaxed/simple;
	bh=TaiRS5P5fOIL9sIPrFQC0WNVuv7tcB3SoZ8snli9MIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PqorsSvkxX+0NBUMuPe9//Rr292an4pjZ7snQf+JPWt3VnRfFw1i3MuywUx+BbqwxVBONfadezWKhcXQK0NHL4CpmX+0/rbk1+QHxGNDT+7nk+HkQzU8/Jvfonak2uuDEYqz5V3036p+YsITIZzA0oZvErRVk7+GSxL5Aq8Ugxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XLvNh1YC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hxlFM3KJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XLvNh1YC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hxlFM3KJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H5vJo1277955
	for <linux-clk@vger.kernel.org>; Fri, 2 Oct 2026 19:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=enfwIbnhH/C
	SB0TdnUwnbQ+pUkNZL4kfBdvjTEYVaF0=; b=XLvNh1YCf56lWz8uEQVJXVtuujG
	Dk6Rssj8A3DcN96YsknmaUPkovU27dRdKe/1SufvqKzkeVXl1tQNaN/i+2+7+m/f
	eXKFSYFojp4RFZYh6G6uqCI9LkWXFFGadrDKC4ztcH5rf5ERvfoR///5sQ9qjYlS
	0Q1fsa+VcsYOmvNsxLlH9TLBV2fgoW/ZwiOrYeCN96j/daozHPdF3jKAke/8AEfo
	w2GWZn674lnhmI9+1yAPIF49/lUaThaEt6FV/FwfFxrKUFU87+bdZpo+eoJsRaW/
	n6CJCnGrqKfutUGtaowQ8mORSxYaVxbM3GGIG429DONNY0yFDzpjcaJDJ9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2dxdhedm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 19:44:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb6391e89so496660585a.1
        for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 12:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790970295; x=1791575095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=enfwIbnhH/CSB0TdnUwnbQ+pUkNZL4kfBdvjTEYVaF0=;
        b=hxlFM3KJRvKcZ+A5fWIAKV3tQiqn/Br50NF33rgdQSv0CkUI6VcQK3XlUY0GTzvkW4
         M6SFeUxiY5Qw6/Syl7m1ixhtlhJgTQlMRLJTHfxoHZIWhzE3KWcFLO/XDE4/ZRiy3hbu
         JwSttc0l35cPLgbxPXwZMBB5VIfZ2YBIS8SlQUPvzLC8TnkG8241Ua0vo+EZ7Z7gN0pi
         nFbplqWp1B+ALEQddEljoD2Y+F7Cwt9QsveA/5m29lFoM/OH4PHojgkbeVwPXolvVQ/M
         dCQqAQbErfy9hlDWBVla2mGaChitilrwVueKTRlsNiuuUCeWhPp5RCVw+UXBeccxO7Jg
         snXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970295; x=1791575095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=enfwIbnhH/CSB0TdnUwnbQ+pUkNZL4kfBdvjTEYVaF0=;
        b=pX1jiqLObH1QijrGKOxoKRpd08hjdzSOgNgkmiPeyq+WnRJoX/q9sdtKCvh4n5haEi
         2q9V8rzduckUyOwul0ibBUnE2D4/yLU3R4Y/edJ1Bu9gfK4pgdOMRaAwkOW7BO8h6mTK
         a9ijqjpgEIen9s0CHTCYIDhZqh/bTcdLolhmGajPlnwKRxr7GjlY3z/Owfr28abC0AjV
         lTPltNLseSu8fRiat2pj4EsePhC7RbdIH9W2VIqIo0gfg1rEdaNXbqVfD+51PaY9S8f4
         JpHC2odwCGRiYStHyCDbEyiqF9WhfknuA4AyVqIYl9aMdB9ygwtn14vgbQpYhfegnVit
         vLhw==
X-Forwarded-Encrypted: i=1; AKwUvBwD0agvSbE/HflRQWJm8Xo1jccg+yawWuWU105oFS+wlILf4yY3gOY+WVVOlve344cUjmH9fKdBq98=@vger.kernel.org
X-Gm-Message-State: AFuF++nX0oniB0wM+m25horu/pItqeLSx0LmLOiAd39AMIIhhuQdfCU+
	ceX2F2Cyxk4ZzjqtijmqYbKD2KbHVoyzMVJFhy1Gi39PJPGjJbT6rjiE0n4aHqWwNQR21Z1xUpp
	ACy0BGGAaMROOJvShX8gFzlQ7oJucwJEplGoqICCInATZSC/PefM2xMxLf2pfPjY=
X-Gm-Gg: AYBFou38BtiSHaWb7jlsLwszn2ZtoJzeYN8yJ7/wYXaujlCNNG0kLRq4Bn9qHTeFj8L
	Z47zuQZkTrYx7LmeNhfTbG+VnOavsTgbZLrn/acIU8J+tmdvg3WjfunIozNiaNL1VzkW+xaA2a/
	VBqtLAWPDPCRDc84HMaWVUJsGNpNRNeR9nJuaHsX4dnLD2kuSALbuJVMP1Fm64Pi1yAZ2ZaHENv
	3maHmQwG+dcH58SeFTTuE/KaDzhceps0GCMZkEazEWGaTcaQEVpAc5OKueoo1CJ7HxN7x+kwF4z
	3hbI14p/DpA2p6FDbMgLEsRQ482iPr+D6PwDTsFT8PXSWVtYHFPPQyV3SDLPctv28Fu66tTyjRF
	EntcULN9duBAo
X-Received: by 2002:a05:620a:394b:b0:93c:5c60:c3bb with SMTP id af79cd13be357-93cf19ee3b0mr711558785a.62.1790970295405;
        Fri, 02 Oct 2026 12:44:55 -0700 (PDT)
X-Received: by 2002:a05:620a:394b:b0:93c:5c60:c3bb with SMTP id af79cd13be357-93cf19ee3b0mr711552385a.62.1790970294774;
        Fri, 02 Oct 2026 12:44:54 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff3cab2sm37791495e9.2.2026.10.02.12.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:44:54 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 4/4] clk: qcom: Add lpass clock controller driver for Glymur
Date: Fri,  2 Oct 2026 20:44:35 +0100
Message-ID: <20261002194436.1275056-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfXzq9Rd15tCNzX
 M0RJhahFAy0ethQwRLKrfbFvrK1tpjYlBu3fRvnDx0srZx62xBvNHPk3uX2wtxvRRB/ADEuMDsU
 bQlUTBCgMTjofxdt8qIZxCq1xnuY9Qc=
X-Authority-Analysis: v=2.4 cv=Ko/YSmWN c=1 sm=1 tr=0 ts=6ac009b8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=9d4qlcpUcIswrQQTxZ8A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 7GVz5uqu2OkW5zCLUfT9OS5skP8tAXuh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfX+nylw9oMjE+j
 g6g9six076wjYhp2tb278Cpg4QKfL2LObaljV1uTKDsKeDOhp0PkujHaiygdIZBjJWLEGTQdgPw
 +9D5UhuOkT8moFnnOcHc4v41mxrxxWgHdsp9OJS88cbqKJsDc0ugg39EhJDctcerHXK3qLE/Le1
 iU2bEHdR0Y2+Yb1UZNwx2jHMMkYbk/Td2HSvxfUTbwml2Mp+NthULeDiZVaNwsTQipnbcMO3l5g
 LHRCxlqaS5Ff1Qm/RaR7DEd3sQI7dzEIHjdzo41Y02GHFg2g2IUaqVk3ydojpF0eyQC6rK0YHgB
 pScDoenSWywM/0ojCP6CrHFqyd88sAwQzilLJwDXE6f9O7wVo6DeAZB+IjHGA3F75oIKqlzhlJL
 QcvG+Lz05/cW0hSSwTlujghphlQNuNhtF8s0/9N2qGKELOxh5WBWwOTUFRArIbEV0DzJSd3uwAH
 MU/m4Q6Z6DOKsI03FtA==
X-Proofpoint-GUID: 7GVz5uqu2OkW5zCLUfT9OS5skP8tAXuh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020078

Add support for the lpass clock controller found on Glymur based devices.
This would allow lpass peripheral loader drivers to control the clocks and
bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/lpasscc-glymur.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
index b7fdd76df2f5..742a88ed318a 100644
--- a/drivers/clk/qcom/lpasscc-glymur.c
+++ b/drivers/clk/qcom/lpasscc-glymur.c
@@ -37,10 +37,31 @@ static const struct qcom_cc_desc lpass_audiocc_glymur_reset_desc = {
 	.num_resets = ARRAY_SIZE(lpass_audiocc_glymur_resets),
 };
 
+static const struct qcom_reset_map lpasscc_glymur_resets[] = {
+	[LPASS_AUDIO_SWR_TX_CGCR] = { 0xa028, 1 },
+};
+
+static const struct regmap_config lpasscc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-tcsr",
+	.max_register = 0x12000,
+};
+
+static const struct qcom_cc_desc lpasscc_glymur_reset_desc = {
+	.config = &lpasscc_glymur_regmap_config,
+	.resets = lpasscc_glymur_resets,
+	.num_resets = ARRAY_SIZE(lpasscc_glymur_resets),
+};
+
 static const struct of_device_id lpasscc_glymur_match_table[] = {
 	{
 		.compatible = "qcom,glymur-lpassaudiocc",
 		.data = &lpass_audiocc_glymur_reset_desc,
+	}, {
+		.compatible = "qcom,glymur-lpasscc",
+		.data = &lpasscc_glymur_reset_desc,
 	},
 	{ }
 };
-- 
2.53.0

