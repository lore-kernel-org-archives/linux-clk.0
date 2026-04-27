Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060D7371CF4
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271964; cv=none; b=LaRb0Q1NGIY7EsUPNdyFlyddQlAsriepB9yzJAErjrmfp+qjZKz++X7SCrctH7rD7uqrGeEtXXkuzHvTfvyp3AdfiQJqO/ZllVmnMHzABdh8833Fth2qeqCV0heb1cFM6B7z0QEgFNZd8rXDnrHQHpTAGof7+o4r47ad/eNrjR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271964; c=relaxed/simple;
	bh=R4QRkVHAwQ9KrtjujN9XD83vLhDAkEyM/SDEmmoV3Sw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GBQv7SRWYOfby2FAulBklipTjrvf7iTY/FEd6GIVERuzepTDOUiHh4qrU2v0rkqFyVa88B4Lrja7TCvayjExcjVaXwXU7fAwb80GBrWXq0J7Tjulndw7kb/Kfjh9y/bhUzp3FfZiwibSudbUICb4mtm1zgOJscyLGRe9G9u0p7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hSHs70Vd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EbO8VZ+m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSHs70Vd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EbO8VZ+m"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QGr6Ox1950998
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k9t2Skqy5JANgUESsWXa9v41qvVlWGnC0rrJSF/Em/Q=; b=hSHs70Vd+yUPJWyd
	gHC8XZXPfCL8oSQ/os1j7z1/ZUPcFBHGA/T7FnY0wCbXJ0PJhW+luAhrHwlZJ3k1
	t7fAS46HGGPaVCWs1vAZRKJH7KKGUTNQvSMB1ND540pEAuVtzQlv+Fstelt4ah/7
	0z4SCZpX//EP6aDBp4uuX/FxjaCRv3VIFuyIpQkigihekvxT+aWn/+Unl0ZWbi21
	XRgJ9BsvFuarm+0ZBTAf3liFbamz5tPXwhcZb/XCaVuqBwO+QJX/ew5MMmpdcqtI
	Hn1/Tsg8q6OdWhu6/aisW54TrbnWVnzhe9a+EIYjRAZZviateIXXwosiqAMSFkFn
	ErPJyg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqtct07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:39:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35842aa350fso19307458a91.0
        for <linux-clk@vger.kernel.org>; Sun, 26 Apr 2026 23:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777271962; x=1777876762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9t2Skqy5JANgUESsWXa9v41qvVlWGnC0rrJSF/Em/Q=;
        b=EbO8VZ+msehD9Vy7LCxLsUMX3kRX27XVPKyXzBqfX6MWmOPIlY8RiaydPsRF5QKkjU
         QLSJEbDGc/eKhuFOe3LA1mCU5EdPWBU9O4Eu08Js78tHdgFjbi/V9+WofzR12+nbhu/x
         Xlw5SAk5pR+qa1IegGgUb7ehRn7OqFc5hLQbTpBsEx/bGnstGpFFIdb7mUiUEyVeyjW8
         kmStrFJ9vGedUhg7YPDN3+mNNarQ6+ukgK972PCwp6hriyiFTvjDo+SKl72KoF90H+S4
         yzK+vEdMs6Tlp3eY/NMvMY3JyJJiYtshU33bSs7TdbhmJMaYVEhkV0ec0q/LWzAjCRs4
         HTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777271962; x=1777876762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k9t2Skqy5JANgUESsWXa9v41qvVlWGnC0rrJSF/Em/Q=;
        b=cOtfmG5B7zIrNQqBF3ojdR/HaagrIhClOeMmg7/1CSAf48NyibJOMaRqNVRCiyWIf6
         E36OTvLHxt6jRcfTI7iLlopm6jrbkVgbp2BsXM+MJtCsUxv0GyuFFJAi9i1YkGIoc3ZF
         O+glXg8HRJ2yG7Gs0P+BCAXU01RZyq2vnvOu4ZU2j1v9ycC6lw5sSvfV3WE4xmsocQ07
         IpjB54Jt8KijymO1grBQJ+DKSbkdyyx/I0dd0Du9Z60C3v0OesROGVTMvrBQUThQegI8
         3N2ysWC9h58xsLOfmqIStVIvA/yAg86d6ninjr2t4wBvf05R7E9KiSOxv89VrsqTdo4D
         H64A==
X-Forwarded-Encrypted: i=1; AFNElJ9VGMQ9bc9usFVDJrJls+FONX4DmS9chc7hRhmyAnCpVO/8tTWZBiZ5iJ6EulD7rPBlc66e9H1E+Ck=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZGoTWAD5yvAHIXqTVMQtZfWv7b9+KQuix7KecG/ZCfI5I1XXe
	KwdTYDDKy/IC9YIzNM6/55sKh6ruQE4YHPWEJOCmNUS+5dwykSLCSg4IU/nZi3YDxMSi+pDhziy
	16xSPSIndUhvPX9I+u05kjdpR6KD0irQcXo7kH57uzUzVGIv2u4smu5werrfz4G8=
X-Gm-Gg: AeBDiesUplv7iGPa7zoF2dlu9tYWPNV4J+dCv4X5/SkGFjlo78mHvq1tPpZ2lli8ud+
	mfmnpPwOgy7j+grpRsA7IpURVQXDqUAozDl6ccfXojP0d9QH3t0/G8bx/l6MvyZzFw3sBqR0usP
	BLeHB/r0IC48VPP7yQEOn+vOGBuqMHBS2l90/LNr3aizqS+0x8vyGypTGo6QzFR0FtTwWqI4dzy
	0IJkn2STArKtyCsKJmw53BhPAI5DWP5Rhb59c/pK3tslyUtBiXkvZJLsK51xZdNLLWNUgQBLRg3
	NVxwSBRB9HqiX0qD6mcHhBsfYZ8vp/yH/u1E61cEsKwOZM5VxHYeLLSXiyZOt01CHh9uRuXxE9M
	eCuCfjvJhYbXVpfkXvTIn9WzxsR1BuBb9Y7DXgsFMkesTa80L8Q3dsc3f
X-Received: by 2002:a17:90a:d50:b0:362:eaa6:a3a2 with SMTP id 98e67ed59e1d1-362eaa6a580mr8394450a91.19.1777271961601;
        Sun, 26 Apr 2026 23:39:21 -0700 (PDT)
X-Received: by 2002:a17:90a:d50:b0:362:eaa6:a3a2 with SMTP id 98e67ed59e1d1-362eaa6a580mr8394436a91.19.1777271961165;
        Sun, 26 Apr 2026 23:39:21 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410a7ab7sm38628234a91.10.2026.04.26.23.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:39:20 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:08:56 +0530
Subject: [PATCH v2 2/6] clk: qcom: gxclkctl: Use custom disable callback
 for gx_gdsc
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-gfx-clk-fixes-v2-2-797e54b3d464@oss.qualcomm.com>
References: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
In-Reply-To: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Alexander Koskovich <akoskovich@pm.me>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=J42aKgnS c=1 sm=1 tr=0 ts=69ef049a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=r9sBLZ6K9uwiCka_ugMA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: TRe_kbmTbOHU-kdKqhQjXupkaDvGL9l7
X-Proofpoint-GUID: TRe_kbmTbOHU-kdKqhQjXupkaDvGL9l7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2OCBTYWx0ZWRfX6/ckxAg4a4V4
 sKWgYKRT5U6FxURr+4vTeZdjCzS8k/IrI8N30hE6Jk8874DVIT9qUdfbxIw2hSlpPhIrFvT8NNa
 fpuuK+iqPSH6Jp2wcNQntSCE6xaN4TZJ+h9mbG3jHXHCm/AaG58o5eCk5lN26hcmDV1OJppKAIq
 Z+8ToRVbyI7pq9VZ4yZAeXSrt+9AtlgRhZAqELuksf70C78UmcoxUWFx1V1fo5PTHx/RQ/WzcUo
 zf2mjx9yenqFwVVfV6Kb+rqMIZlLD91xlmy9ZBV7fvd7JTHk5skHSuHgQ+gOSikrIiQGObDh68X
 UAFhE1HHxwNr57u+7FdNxfJb5gncKd1Pqprvy16Or4Wo7pSN1jmbNCBleoPxNOUvKOV9o/Mi43H
 JbloIFF/ZvXIKXW8NAJ43DGigP687B0PmDXC7b6KzFrSpmxLOeJLuhsftwfrb7OodDFYLzWJv13
 C8aNtOn/7ZcwuCgnUiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270068

The GX GDSC represents a special GPU power domain that must not be
disabled during normal runtime PM flows. As per the GMU architecture,
GX GDSC should only be force-disabled during GMU/GPU recovery, where the
OS explicitly resets the GX power domain.

However, when managed by the generic GDSC runtime PM path, GX GDSC may be
disabled during GMU runtime suspend, resulting in warnings such as:

  gx_clkctl_gx_gdsc status stuck at 'on'

and failures in gdsc_toggle_logic() during rpm suspend.

Use the newly added custom disable callback for gx_gdsc to ensure the
GDSC is toggled only in recovery scenarios, while preventing unintended
disable attempts during normal GMU runtime PM operations.

Reported-by: Pengyu Luo <mitltlatltl@gmail.com>
Closes: https://lore.kernel.org/all/CAH2e8h4Vp9fJYAUUbOmoHSKB25wakPBvmpwa62BTRqgRQbMWuw@mail.gmail.com/
Reported-by: Alexander Koskovich <akoskovich@pm.me>
Closes: https://lore.kernel.org/all/gwVAH2mJerU4dBInw8pKmOs5aQK55Q7W6q_UQAlLFCsEgX6eyvSgXAWbNNMqAX4WmPlYCKUSMhfkr5Jry4Ps5EqnxYZqEEDd3Whwv7ZXGlc=@pm.me/
Fixes: 5af11acae660 ("clk: qcom: Add a driver for SM8750 GPU clocks")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
index 40d856378a74aeb706c2f4a7a17a2c5602042af2..d7cf6834dd77c2a5320ffb8548cdb515be237bdc 100644
--- a/drivers/clk/qcom/gxclkctl-kaanapali.c
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -26,6 +26,7 @@ static struct gdsc gx_clkctl_gx_gdsc = {
 	.pd = {
 		.name = "gx_clkctl_gx_gdsc",
 		.power_on = gdsc_gx_do_nothing_enable,
+		.power_off = gdsc_gx_disable,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,

-- 
2.34.1

