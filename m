Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620150;
	b=mIjf3ssnDHcSs3MA7scHLp11dRrGx5wfNk6xYAsMJboVmtzV0G4KcxzE/A4q+qSVaeBU
	 1/8wKZmy5sG0CDgmPMBAB49xnHHcpdQvq4bxVqBuna3SOtznZaFoWwMBZnfSLbE+vZGz+
	 P4/sPnGrXhNF5CnshxZic5dVuVD04xNQEfj3q6/MK7bJuITKJq+1MTUCoWUMNWk27Vsle
	 fsXlRDa6SI71kmCmfoR5qtifE1Z+AEevahGUehBc5GTV3OEob14meZI7qNeoy4/2aGubp
	 sdO0W4V1GE8FBSdWQ6Fk1Ia8qQr1ueiEqX4R9pTtOeAlVcCshacFTtDLGFqeanouZ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620150;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8EHMNmwkCKuUSV7NYbcIdifNC4vHEjyRqQu8cw0rKno=;
	b=5t+4C8Ps6t9unlLwnwZoGW5HXP8RW3RO/xlzaQc93piFYBwX8u2GtZY/6VVl8MSkGp0e
	 vU0WdEeenP1R2R35Nb+RhtzO7hBSh63Wkq0vlVE1+qDHkG/KjEaXk2mXYh8UxGbNvI1MO
	 eibVg0u59Q5j/jUNcDCaS/AC7l3Mr8D1Y9m+EDFVdl5RVK5t7xmpObA0Q8LWWBj5eXaLB
	 Jj4R84NmwcMBFkx9TFWQrBhxZJNM+/B1g+/S+xavyV3FAzW5GOP1JAK4uvGNLfZro00jY
	 0hmFlOJ/57NJF/pxfFDaNowfd4nh+Teh6xqvJ4XZZ4ckZOcEuXZHqq08EWyrhVK4hUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M+LxwsAK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nb2dzrSB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C5260A2604
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 11:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C5260A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M+LxwsAK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nb2dzrSB
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A299unp3402352
	for <linux-clk@vger.kernel.org>; Mon, 2 Nov 2026 11:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8EHMNmwkCKuUSV7NYbcIdifNC4vHEjyRqQu8cw0rKno=; b=M+LxwsAKftmbCDgt
	MMYasS/rNqZr4DJEH/TR6oFS86p0asQzK3QUECCQyn5da8o1q0bNg7uvsWTSlBsd
	7jxX0VAjNSveNXJEPxbYM2v8CSxptrmLGwY+doGxR8Sa2A01N8xNyaTNtjGwO9AM
	kFGM12CRGAAbLZRYPgYMrKV2sRKvPj4FnUoizGBKjR5t6eMIEdj6OiGrgIMeBXJd
	1hB0umMpcd4j6yYt1sz0Jz5C8kUwnpvAMY6OBRRsUjJ8fFAZjIKyjKIvy7nq8xcP
	jNPMz0SJwZo0R127gYQrm1+pmMOQGwXMRPX7O8XSAMBEaIUXvN2Z8RR0xE4WkJA5
	cHlXdA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe8x83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 11:49:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e49a1d3b1so713291185a.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 03:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620147; x=1794224947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8EHMNmwkCKuUSV7NYbcIdifNC4vHEjyRqQu8cw0rKno=;
        b=Nb2dzrSBhdSVoCuSKrC4kvkIIzt6aSLsSoCtQR0RvaHGqmL6F5+g8HW/WTLAVj+JC2
         DiPKCP3R5FlQjM86zGHx4tNCl5DGV/Oy+fAZGG5ZP5WGl+oV/OmezwxbzKLfq+w4qxMh
         pjnsQTGxJXfZ938/b2L5G2bT4B10SUs1J7eyf5mZbxdos49EWapG83BtRHswF1DOsojs
         Z21Md4Urkszt+aQcUhY+kydFMrGefn7VvCRb9X2HArRCWRJ1P4O/OaGeFP7DIUi2l3+9
         ZWLtyZpmFoRRmskp/mcdUZgWcnWueaENn6K7F7O1Mtp/w3Zabsl9z4M4zBY0hrufPCMn
         ERNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620147; x=1794224947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8EHMNmwkCKuUSV7NYbcIdifNC4vHEjyRqQu8cw0rKno=;
        b=xVyCC/gjbuQ9U+i+enQZheuxg/LMReiiBq4e36t/MWOPGg4ScPKyMKwjeLyyHFFc4d
         I6oXCl4It28cIHGtoSFOyYL0HmihwzrWNQ+ZICHC8xr9rIAwJd5bVGy/lCaNl/v42n6h
         RhaIGb+6RQsV9kW0kczYG0PXn1mH+IB/KC6lWOWwQ/Vu5Dm8VUMz0BEWf4w0w+KjAU1V
         RGrRyHGuO7u30Js0ZYzr/mVax28uw3MFj4mEqWolI8Y+HZele0kAMwhJovWant/iwr6w
         Xf+Pu0kbnN4is/ThAHU3GTicyru3hTBX7MJaGaAWLeNRiXPyvJgTm8AeZjSYKeJlqi0C
         iOeg==
X-Gm-Message-State: AFq9FYLSdkWRzkgQUas42NjHU/M9K63jxw5LZ2+QOYajwtGOxiSNEVDW
	EIW9JbqHYGT9wKV8lSzRhWSNtXsPxsb+xw+m7+4xa3luMQfZ8dkdN3vheR81ZEy1dd4BfZm5Ld8
	vvoyyzU9nAIugo1ww3jlX4fpryMqxXH7EPNqTTgqVdvnMAAWLluSNCDUOood6yD8=
X-Gm-Gg: AYBFou2gN4FvpJ+k07c/w+oYffCfJ6sjWT21FgdMeOVuVckxXVhGH2XraCcBXK5JnET
	azw7mD/pmhEYUwx2bzneuBCe2A6ElBDW/LZb/vHS2iYB47mrMUQ9RiTiBzPTUzV968+nU1w1VS3
	dU+yX4rbN9ZbOw3LIuIMz0jAEsmqDJdvY/ojUVwgn3SjY+KPxR5k+2La+gm7e8wqxazRwsib+3r
	4oRunIUrIfjBIHuHD8g2+cp1+KODbfxqw+cBIoDIsPoNKPZrGYHEyzP+17u9Q/ecBBMKgxikmOL
	rDacgI803vpcbuNUzGq/o3F1NF1H13fvzAonvCMCaIAJ/qASNq7vWV7Nj3NzUzkii6puTD35IS+
	SOc/Ryu3MWcINOYr+eC44JbhQArZxkHqyt6Dw4eoo2GmU0Z3W0CGJ9bIMZw==
X-Received: by 2002:a05:620a:4385:b0:93e:5eaf:dd87 with SMTP id af79cd13be357-944217c1057mr1505386285a.62.1793620147366;
        Mon, 02 Nov 2026 03:49:07 -0800 (PST)
X-Received: by 2002:a05:620a:4385:b0:93e:5eaf:dd87 with SMTP id af79cd13be357-944217c1057mr1505383685a.62.1793620146775;
        Mon, 02 Nov 2026 03:49:06 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm19766031f8f.20.2026.11.02.03.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:49:06 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:48:51 +0200
Subject: [PATCH 3/3] clk: imx: imx8qxp-lpcg: Return an error if the parent
 names cannot be read
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
Message-Id: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-3-1c3fc3fe727c@oss.qualcomm.com>
References: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-0-1c3fc3fe727c@oss.qualcomm.com>
In-Reply-To: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-0-1c3fc3fe727c@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=2uPBsKkTO9u8MCGSda/38zqhRD7AFxl26y3ujADk3+8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6HiqqN4XJosCAMvkcauXt+bMtOzQ17SPXFOX0
 6cQ/pXmdCGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh4qgAKCRAbX0TJAJUV
 VsHLEACmDvcbVJdkVpIlT+OZGgqy2hYn09SA3vioW2L1kBakvGxPfl9NjLAnwChWcC9Bv33IIkh
 95VCogjvOrGTj1FdqY+5TAD7LGjqWC9Igznipko3jsFBzF2kijDRe48YiabcbKptsuYY9ZNmwQz
 aWTHHhNVwUqBRiTw50TAS+4Ub5QoLOC+oYQjFJTMILKnxn5rxBPFAO7nOjWtmBa1IYDTbR4r/Gl
 iXNeHn7xMSDIEZriXFQ4xh2XqG/pIveaOHcVJFJotHelNEk9H5G02wmxSb9ITz9YeFipBJ5DzJG
 fc+KTkU/iDdiNu9evpAbFbi1mJo1KVFs4CiXUAzUNAfqQkTbJsqqZfctHL7QIKVnQGZu4uibWL9
 FyE9PqsYgsyUsdNUDMswrfxqMGD0AlF/GfGcjL2cduQ/gfFaa9Pdx3mqnK9Dbbwp6+MFyf8Udyt
 ATJ8jEphUlHJ8s469efSVk2I8mdjNs6+M18BoWAwyrhYULSvDUJnSmi+Fd3kt0gIeGTVc9s680R
 XDmgpw4k0EBvp8ofJ2xXnb+CfiEilzUBY5r6F/O2hSmiUnjVDFBS4GhEcQR+6hoY+IARJdw/2iF
 SoHZH1Ssld8sjQi7vY+0HskfhWLt/O+loZbPpOdQYlpjXjDpMzzX/NjAG6jQ1wke/2EknoASr8s
 UpdTSlJt4iskH8A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae878b4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=hWtwQ3EaNFkubv4X:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2Br6plB5rF9h3W9bKjcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX8gScXgw45ObT
 fDfIDKzOjzMa6zvfiaPb3V+wfEW/IW/7WZf1CkjSXlDH3ZFnu/9eF0/lvdnMpsPkk2h3MJOAJmW
 qZoZNLJ0eFl5P4b6/FdO/BuBWno/AlAHpn/YCEeOzbqxu4V2nHOgZHLi5Pgas1dekmRQXmL6St4
 k54EM642LrrbXkxgPZrS4Cy29Fd0JE5RVpkPYALx+ULg8wYHnZiDpBdhY0FKApgDyfewlepgHE2
 gMWoI/xH4SQGXY7a60x3tMoxAOJw3ODsWDwEIBvFS7A+fQkwUyWfxW6DGa6ewK1rR5WJNVemLvx
 XNl+L6XFX+rsk1UlyVhX6oToc19+4gdJ/VQKkwATG22J3/+NWIysSrRIrQcOUAWtXMIBUELz4Ah
 737NueaOvTA0/NQOkzKZsa9OnpPhHskNRJ/y7AWadnvIBg085OGNUfrEId8Dfra87qBd8E8FTn5
 Knk5r19BnHBTwo/o4uw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfXwb7Q+7CQ8T6m
 +BvPZpgA07sHJ4VdVmQxi2m+cBJB+fn0ucMGCoOQhYWooSw4ELt10dqYA28Sph2oCklwVsmbDLL
 PfVnX98M0FME36+k1i9KwG8YIlTJei0=
X-Proofpoint-ORIG-GUID: piEtyk_DChDXdKQgvREYNbxlGyqtbMZa
X-Proofpoint-GUID: piEtyk_DChDXdKQgvREYNbxlGyqtbMZa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020046

When of_clk_parent_fill() does not fill in a parent name for every
clock, imx_lpcg_parse_clks_from_dt() returns the number of clocks
instead of an error code. The probe then falls back to the legacy
binding as it does on any error, but a positive value is not what the
function is meant to return on failure.

Return -EINVAL instead, like the other parsing errors do.

Fixes: d5f1e6a2bb61 ("clk: imx: imx8qxp-lpcg: add parsing clocks from device tree")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index ae8cb5408246..4070e06f9c7d 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -231,7 +231,7 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 	ret = of_clk_parent_fill(np, parent_names, count);
 	if (ret != count) {
 		dev_err(&pdev->dev, "failed to get clock parent names\n");
-		return count;
+		return -EINVAL;
 	}
 
 	ret = of_property_read_string_array(np, "clock-output-names",

-- 
2.54.0

