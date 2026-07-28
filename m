Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A345441A515
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 09:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232794; cv=none; b=ZwX0u07gFdXd2U9LdrUPX/yE0nymrwaas4j4+iySYZQ4egjtM0uYeKJEB479+OC/cFPqFU4V+7BucKIRw+sRCijgoLIRnywVg8HK7mLRcuc24ARtAnS8wezX3Bx28/uWwGWdFdwHphJDcQQZ2gWsPszk3htGF9STVCU3zdMvVtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232794; c=relaxed/simple;
	bh=+0Wbn7WCEuDzhQgR47IsKajWKvA2zjxBMfDYi8y6aYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwL09hz+kVQa6A6AGn3oQSmE1PDXAGUbIc06uAItrwWAiB8ID3nvs3jtvAn8jxae9qTPRaqlzxSnewOIVCUDgmZFeequ3cbO7Gwzp2FHCZdhj/cHuDHd2vdHv8JaD8LqvdtwGLZnP9W6h0uoGL4+34DnF8uGFuk8CD/DR+AKouQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1ev1n2U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P1HA23+3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1ev1n2U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P1HA23+3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82nos2309797
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 09:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U5PN1TT1lMw7TFu/s+fchO87
	W7nUXA/Ck6/FI9wxkQQ=; b=J1ev1n2UjmCEGnDr2A3w20S3xTEdMbyk2o0n2O3b
	uydHI8Fdeh6KmvEcUuikaqnKHsiZRMxfXorFisVwty213IRNbxOFTqYqI3AhFB04
	2CglaJ7ckrkNZ0aaVIds/BzE2qKPgBo4kTvMGXmIeTvgDk/7CSrYHgNYcCUKyoXn
	DU/kSTJ7rAHH/q5jiwTr1yV6Pva1HsPkvCIF11KSqlLbd4hrwQv6zFfK8jXEmxXF
	RFJthzdSlIov3kNjOQTSIFSrcJaG/I0LMHODKM3hFbk3eAJpVfGRdY15vBqD9RIr
	YJmaYfwyqdp7xuZOpa/SyTsoQTdvKpddt177lKG98FlhfQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7j5g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 09:59:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d30035dso34257351cf.2
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 02:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785232792; x=1785837592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U5PN1TT1lMw7TFu/s+fchO87W7nUXA/Ck6/FI9wxkQQ=;
        b=P1HA23+3BW27APyHGGpq4/JM1Ag1Nv5rsV4bpzRotGNvQQNhgiCQLtMES3EapcuJLB
         WtsFnaFlAmhWtHXBjoCTmbk4BIzbtXOa3pE29zJ+s0WiGhYa8LzYO+8HVD2LI/rkIItU
         hST9/FkNGzu2TDgjvGpcPWtxwxDJszx/JIepVqKSKq7hA9QJsbcio6chAbUh3GiFrgd0
         hajSYexESN9nb1SuC+LgvD1HjHD07UgS/XfqOZtLijQdR0GdCFgadqeZN0rEt/klkRuy
         KXhH6RAPGR6wL/Z7M4N1w8lcrQw9eeuha3ZgYd2nnwVr8yqBNl2lC+DFa/7a4vAn3mDP
         ezDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785232792; x=1785837592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5PN1TT1lMw7TFu/s+fchO87W7nUXA/Ck6/FI9wxkQQ=;
        b=JQdLJGjsAp/CXnCuv/7Q9iUL1Zad5tEaRlQTQm7MNyuaSMCml/Ym3ooLdgnCTwOK5z
         6qDt1JaEefH91esjC5wO1T6jjAKShENofcBohnSM1dAFQCekDGFPmHPmhJ/YYCfVm/03
         jbj1iIENxEDe7hmSkIUmk4I4IjJ75eUANNYQ8z6IcY58exXJQPQxghGDCVpLSc3CFR+d
         qVvgnyuCrH1zx+yUNrxjuZ/W1LrdwXmnVNQw1WdxEsrTtYI3otc5S1HsztubkYabkZsw
         5C7uqjzi36xMMULOEhi8GMWmq0dAZoGSAYfbp07uUCAO4SOUp7kEuvWBbAlt6GyN4Ad6
         aX7Q==
X-Forwarded-Encrypted: i=1; AHgh+RoQNxqlwoWd2SyBzO7KU/ITTHjpBcjS6r+crl/BuZvBIDhV6HhkE/bBLWwFt/yPKRwIsV4yDDUIBVM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBDQY5E2tyIYJCgxeJ+iJQEBOFYJ63S0af0nUbodQbqqNQnCdw
	Sr9qXmweLjZOyh93+ZymE14jZGhqhR8cdTaziROZfZOQPxnAVHRoKT49oCrRsTLKXP25x+vbVDh
	W08qKf6Ag2I01aum1MkC2Q4W1/XkYMkxf6nSRwlkEbpQRuapIDameqc/piGYbIno=
X-Gm-Gg: AR+sD11KVDTdYhWif89KertxJP8uYoqJhVEjVULZi/TnBRA6r1MJzUQwxzDBe+Xzcdv
	BFr23joMpn9ePyrDE8qr6hEYadF3cv8I7AlP4mOhYLctVsTe+UBJi0YZo76eyF/l7OcA3JlIAhD
	WAsZd8nBq6Ug+W/qHV0ihbdyH32b0h0ZU+CoAyQI2uwlNg1wXaqXuXFTQzOxP17PeEpbv8yrvDl
	OuGS4qnS/MBQn+w9g5uThJaIRsyMA4bUUmjuy/W6YlavbnghUUFt6nSC5NTTPbofnZQ/FsHyYrq
	cY77nLvIN4ouCvwNoEBhxRE9wFxb56ibTfMo8w80Z3HmR8t4p6oEySN+TMW/GgToR2Y61zS3Y0B
	45Q2sX+sGBVQxKc0=
X-Received: by 2002:ac8:59c7:0:b0:51b:f25c:2896 with SMTP id d75a77b69052e-529d6fa0310mr13120401cf.11.1785232791991;
        Tue, 28 Jul 2026 02:59:51 -0700 (PDT)
X-Received: by 2002:ac8:59c7:0:b0:51b:f25c:2896 with SMTP id d75a77b69052e-529d6fa0310mr13120161cf.11.1785232791475;
        Tue, 28 Jul 2026 02:59:51 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b388d5b4sm212090015e9.3.2026.07.28.02.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:59:50 -0700 (PDT)
Date: Tue, 28 Jul 2026 12:59:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Frank Li <frank.li@nxp.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v16 2/3] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Message-ID: <2hmw6cq6e5ba4hps46k2drdutaofcqcrczjreq7hoikmobb7rm@wbconxilsxg3>
References: <20260728-csi_formatter-v16-0-1065ba47530a@oss.nxp.com>
 <20260728-csi_formatter-v16-2-1065ba47530a@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-csi_formatter-v16-2-1065ba47530a@oss.nxp.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4NiBTYWx0ZWRfX5eoT9DZVxLNR
 MvRm1LRyf+/TPMwtvabE7K5IYlGqSbyQdR+/pvT6lScGvhmEHfpkdh/MrGLlRH0ykNT0W+t4yeI
 F+SBj98BjsOpQHp5wYq5iuHgT2JXE4X6l/yHsAd0Xu1AM4kQgwu8dSZ4FwXAPELuNyFkZ1uwsEB
 MlOiK+fJ1Yrk1k10bOQLVCTQApbPN/nuUaIzxN4qx/Qb0BOCHvRM4Fnh2mvpISR3AnXD7qxiqtM
 ERdjIiQgohXFancVmpwyHIbGU5VH3Tr/jLN58leYlTTKKxciA7hsQAdy6TKjf+tHtW/jM66W4Xp
 8KdNUgfVZHTRCO+Uw7xD2boDyl4LRhTjsBwo1pNzxHiEHmArwz9VbGmyLJpRB9DmXbrp1aY4Rlu
 1qmh63Lulk6cE0wk3stbAhTdqZVbtr7BnUro1X+sAMsEE8cFeOWmyfb6Ycs1xQ38SHQa+2w/bU1
 ENnvN8hga2BecHxUCjw==
X-Proofpoint-ORIG-GUID: qehuqdOTrV81OwLF9_Kr3VpSFR7jS3pD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4NiBTYWx0ZWRfX/6lFEpVXJ+5U
 VIXxVBtuTTNK8Stt0IHiDGTaWh8kHE53aGEFkt28a7fttP3aeq6+nykFyvtadKhwt79L/YnRCeJ
 N3iFVtQ4AQWDM1b3Ws9Imq7MWp/a7QI=
X-Proofpoint-GUID: qehuqdOTrV81OwLF9_Kr3VpSFR7jS3pD
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a687d98 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=P1BnusSwAAAA:8 a=mdcQqFF6s0ROXEWFMbUA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=ST-jHhOKWsTCqRlWije3:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280086

On 26-07-28 14:14:15, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The Camera CSR contains control registers for multiple CSI formatter IPs
> at different register offsets. Each formatter is an independent hardware
> block with its own clock input and media pipeline connection.
> 
> Define schema to allow formatter child nodes under nxp,imx95-camera-csr,
> with 'reg' property specifying the formatter's register offset within the
> CSR address space.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Mauro, please let me know if you want to take this through your tree.
