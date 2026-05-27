Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5499B3ECBCF
	for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 09:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875303; cv=none; b=VBKOAcFyY8lUj8NB+a29n769gAEhemwpenoB3bU0YpzP8OFNsaIWREWr3UgtHs/31avtfErZP/sLUpyK1htxj3oHEFG/fN6YXNnpbwgZa/Z1FJ4dVWfH/Jgp9/wO5WBRr6KutqUQChacCISuk0rh9pmszMDsJrk+sK23f4vrQ2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875303; c=relaxed/simple;
	bh=8i9XKii1mgou4u7NmcKhxxnTTNhNh407Dg11kltbq7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qZcdeNg8VVFR11qiiRam/qXPW9ZWbOQgUXpodknZiR81/iGHXqiQHzQbz2W44kQv73Tw+/eb1gl9w7dL55kYxOELPan97kldETefBCT0W2ij2z6faeT9cF/1N20KH5W9nk+Z0Zz/vhFCFb22RkIaDZ3lqTiI2QYoPOh/6Nl60Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3U72lyK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SjPNWEuv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3U72lyK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SjPNWEuv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8menc2152958
	for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 09:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XcXJ7ussJcL
	Vp4gCSciGOlZ9khVs3DX6bYIjdliO3uc=; b=l3U72lyKO3Zth1RiZcs+XjeutDP
	CJBJuASGP1GRtUkawoTwkPYm1OjiFBGxyf3gamXVztM5AZ6FO22Ci3s0KjQ3ylaZ
	eekjp4kPVvhdoImWd3kXlCu759eOEuqSEbpkMTeELi97CAruKRhHrDlxHVSBG0qN
	Ed7xRSIT1NicwVnQuD9IOVKi7wAw+fJ3L2idBxSyULkLNo9UnOJc52qMpgFm9+VP
	ipO0ntALN+E5T4Q0lTt/tELNJuu9f4oxdVytlm2Lpcuz22YcY+d1yyVPcCfarN7E
	0vXAzMZGBOYJD4BGkumTLyKEF8R/2mBL1JFANPl5xxxIQbc2nG4y5CGog9A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edu6rgtrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 09:48:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5104b861649so24344601cf.1
        for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 02:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875300; x=1780480100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcXJ7ussJcLVp4gCSciGOlZ9khVs3DX6bYIjdliO3uc=;
        b=SjPNWEuvhNcFv7CqXGofH7pfRFoJUDmF4cgWlCc4jGqzJtj4vnv9NihiyAbUZNXKFP
         NIkhqjvJSiwMluFWoBxN3M7iLFDs+I2SdzeG2UwXWzPqdMZ//iPjreQfJRLlmUokjUFk
         pzyf+F6PX4IaNv8GcRIOz+jatUq3G4/xy7ZWjXm9NC9JOeW75H80XEXTZpuRvuTRf8wG
         z96jOzEZCrMSRhmd7GUDaWyEspZ13nP/nfCG3vZhsutGnejxmsfkQe3wc5j+SJPoCXFe
         42afteZ2yI6HCsYtj24LohwZA+QFYS0VN2j0HNgMvZqDFfNfmg5DmR2xMw1cys4JdwUP
         pibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875300; x=1780480100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XcXJ7ussJcLVp4gCSciGOlZ9khVs3DX6bYIjdliO3uc=;
        b=ZA2NIcceEmtaQE+GO3/pjNvXMFnu5hAuAaIosnsizmLDw+CcRTclPDkY1+TyB/sFv3
         oKMeiHv1axQXQqPu5r00LVYRPtAFEPFjOXcnRN39w85HsFBBwNc7upe/3+obmPe8UJTJ
         r3y3iFDy5sH7sgDE5YWEf+T51mqwIcOZ6FWNCij6ZcecLr4d6Gdfko3bjH8qgmckqnHe
         87mvV2Mx5+7sI6fcs29+aNSULVi4AE2Gyw9h9A7K6U/ZDRaBq5JbWRkWR7Ry9G5rYP68
         Jv3s9wsu9h++8X4ELSM4mRTabnOKc7qePRkYR6VVq2GZ02bvvGedp4l+EwaeoFB6OBhS
         ARVg==
X-Forwarded-Encrypted: i=1; AFNElJ/huZcFE3swpl/W/as9C0ejZUIpNohLMPU/bkkv5PTboKuSgfbwf5jw1uPQC1KD6qrB8aecJsmEVoE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw87r+E6JJ7/PzalxjoJvlIIkgJx+XB6nmMF3DhexsC294bwl17
	k/dn/T93P86/rr23FaqOtIgDY5AOExc2aFQ07SGs9WUK3uAhWaCI3aLecUYSUdCQ4+bDYwHTdRm
	jh7a9/WNtYfucZ/i476hdaMwz+X9oxaAjAtN0cEgZZk4+51l8fmLYd8XK7YGTeMA=
X-Gm-Gg: Acq92OGyH9kcad6CyNqA6lYA14PhW6ERx+b7/fHDc0+SkLyN3Xgv11zS9pmUaN7aY+D
	9RFYp0lRfvMcqOvTbb+3cM1/vGWcSRNgy2vgd/q8sWo2TCQ9eTwC/N/MzpKiHcJHX2UlQJCb7Ow
	oUxgXuL3zBCL97aRoAEiLlJTkyc41zubIOJXrlw4WUcP9Mypgy1tRvXb/bjjdf6j2nL2seRa+vL
	TN0TefqMCVi7Lv4VDvdCOUa70k52Q680JTBRX1QSVa8eu7/lK6MLdzst/M9T7e1qAVF7soJOoOS
	2eKa76+mK/BwbRAGiDdjRgNBXITY1mZrzf7Xp4zKHaf/AEHvK7KR0N4lhXEOoMryJE8b78bOpdn
	7HhlDMt+ppR6vWcwUWOKfSrM8I3gjlf/4tsnzBdp+kym9h5L2rndTZ35xYgwX5dzTlyv2apcCvb
	pq/PmLTTIKOj7muhgDIQ57va5rLUCkPuHH9yTR
X-Received: by 2002:ac8:594b:0:b0:516:dbcf:96eb with SMTP id d75a77b69052e-516dbcfa7a4mr268621551cf.52.1779875300516;
        Wed, 27 May 2026 02:48:20 -0700 (PDT)
X-Received: by 2002:ac8:594b:0:b0:516:dbcf:96eb with SMTP id d75a77b69052e-516dbcfa7a4mr268621291cf.52.1779875300008;
        Wed, 27 May 2026 02:48:20 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68a6fb31611sm544001a12.22.2026.05.27.02.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:48:19 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, Helge Deller <deller@gmx.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 3/3] fbdev: simplefb: Use __clk_disable_unprepare_counts_only()
Date: Wed, 27 May 2026 11:48:11 +0200
Message-ID: <20260527094811.116977-4-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527094811.116977-1-johannes.goede@oss.qualcomm.com>
References: <20260527094811.116977-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MoJiLWae c=1 sm=1 tr=0 ts=6a16bde5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=MIOsnmlco-pcipCrOVcA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5NCBTYWx0ZWRfXwN7AVAwS/V+J
 bh9elFCv65EX8TGvKAehmoXnI2BR7A7rgGSQ8tRnK6RMLMyLDXPJ10HA6hVXgunVoHwFk38gs1+
 gvqPrCnxBM/vmYfIbQgcAHGGmP0xPWbctWMghCua/FWWX1RzowZezd81VyKDecdCrvFmxrQXAGc
 ir69tYfnStvb414jhKi/qyn1GR3Jzk3wXdlamO1Cjk3LezajeJ4D31LwhwhxfJJHz6oXXYViKtH
 RmQxK/4aoiGc7wExNjuRXU31eQFix507XnyzWwuUYo8qCcP3U7iRomlGZ5gZTDh8VZt4jP0Qj1d
 PyMcOJ27boMRRlDBgKw/c/sDWC2AUYTjwmoYXxoDmXwB0oL9SM21JWupUL/uNu9VdWoMXG/xMLB
 7mbUkKHRiwHi3yQVQy3tJRwm0wIWarIvWGT92fqM7KjjHN493DdcAH2iipYO4o9NLHOdY/6s5Qe
 YLXJmBJEGz7EHc3Ckxg==
X-Proofpoint-GUID: lRB6rofAxdFrU92hDqorK7FErbm5mPWT
X-Proofpoint-ORIG-GUID: lRB6rofAxdFrU92hDqorK7FErbm5mPWT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270094

simplefb_clocks_enable() calls clk_prepare_enable() to avoid clocks used by
the framebuffer getting turned off while in use.

This requires simplefb_clocks_destroy() calling clk_disable_unprepare() to
balance the enable count. clk_disable_unprepare() actually turns the clock
off, messing with the hardware state before the real display driver loads,
without any knowledge of the proper display power-off sequence.

Sometimes this leaves the hardware in an undefined state e.g. on some
Qualcomm platforms turning off the DP clocks at simplefb_destroy() results
in the following error when the msm display driver tries to re-enable them:

[    2.980181] disp_cc_mdss_dptx3_pixel0_clk_src: rcg didn't update its configuration.
[    2.980272] WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xdc/0x100

Resulting in a non work display output.

Switch to using the new __clk_disable_unprepare_counts_only() function,
which decrements the counts without actually turning off the clocks.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/video/fbdev/simplefb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index 60e5dcec201f..b1e0dba6d127 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -303,7 +303,7 @@ static void simplefb_clocks_destroy(struct simplefb_par *par)
 	for (i = 0; i < par->clk_count; i++) {
 		if (par->clks[i]) {
 			if (par->clks_enabled)
-				clk_disable_unprepare(par->clks[i]);
+				__clk_disable_unprepare_counts_only(par->clks[i]);
 			clk_put(par->clks[i]);
 		}
 	}
-- 
2.54.0

