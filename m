Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5A63911CA
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 10:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542565; cv=pass; b=HNb7wOENA/wTGQ5TysTukg3F4DZSdcs1G+c/0NIWG9XLl8BQPxq2wqT92OmdVJf1o8Qp/Rhi1pGrrALYFqKqLsj4gTx4/3Hw2HyU8+JZ9kOPe4mnKAZVCUDtZxEQ2K6Uwfv9A+PheQSREu1RYYiNzlTOZquOxPWouaLyKsO5tFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542565; c=relaxed/simple;
	bh=gonrzpta8kS3NyYpO5oAf8tM7TqGksbhlYABaRZ45EU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ncq35q27bo8x1YwKnujalyXAgYbsU4bPeEiJyv7KNE/9jMua0ttLbN6x2sd3Uns8DR/+Ud+D8GHWv3s1kuuMkI0bIKl70iSSPMESbBV28VDzgxxJGTB0dfx1gnpqhfiBv3QNpIGj1c30ElA3PZhbA9DKJ5SpT1seAkbLiteqLH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XcxhXbfr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9kKToE5; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XcxhXbfr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9kKToE5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9vmmJ2045799
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 10:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ROvsO2TXFdYbrQp+Ap8Ei4+zcn6nTffqksbworVfOg8=; b=XcxhXbfr5eq0Gqui
	ptcuq5uBCNNkqTmKuMV3wKvCStUgqnkP/x/ylbyW7LXWDGWBalgY0qPVYPwsZy9H
	a1ONKqnTrmrnYu+LFunmzlgy2FWOUrsqvEwi6vE/oXhIirLQw/rJPhjMcKe+1uuV
	p2nPX0oySTpyry1PztjAnhwFo3+uQvVzi1o4b6JAztxz9Sep0+Tg/5scPzjumIWR
	lMlluBAU3c/BG1zleyfXO0qo1yy1lr8HMJy9Kc7WWcuZZ/HEGenwQ2aP6pOWcR0h
	Eb7DjxHtWBmzJGe6oi4jjnc8cKgAtE6chY0GbIYCxTN3GQBuEo1RnNPi8DRENjmq
	oQrF8w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhggg8fwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 10:15:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e55f0613cso1466421785a.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 03:15:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784542555; cv=none;
        d=google.com; s=arc-20260327;
        b=b3wbIt7CxCGuRBmfFaWoO0L2bYCmZNu4qspclltN6+2jfsAcDmcG5S63du9MYxcw3N
         rg8EKp5Ngup9Z2+E74btmp/11Qg1YfX5Yd3D4q1cKa2zfLFbar5myA2bohkXiHf9iR8x
         z1kEW+01GOLD5hefrHpzo5xTc4qatWhmdTeFO+b7KJRSxF5oZ8HFWBwBR3DpI9Nj5Qgy
         ZMnERfWqMYfX9NCxKZ0BcurUsFGG0Np+0cgnM89B5dVnQ+vnTvnrRGW1pRuSGyaVTQ5e
         sGlp9MyaQK4MUOVIiILrxv1zI+J8VZXMJng9yTwyScPwXQUZI2trxbEP64s5dHnBlpci
         uTuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ROvsO2TXFdYbrQp+Ap8Ei4+zcn6nTffqksbworVfOg8=;
        fh=J9DqzBxr5pcn0LrmsN/7JgMZoOF3jl4SeeoYCN5nO7E=;
        b=iPjyxJlSYV89QTHFGe89XvvUjkOfXAfnwZOasyISW3ntKg3PptrdkZMP9uGwG/Os9Q
         pZvYM/c9zYPvAxsS0zuTXIaMtgmGIe/WMPVCc+1mPRVTAcNb1tdX+IPrt4dGud7qEB/R
         rLfZkMDF2NV6InLd0V+Qdcv77FwWxCM48mswiCbVXJkAb/uP/M6cj/7N2UAUUPpJRi05
         TcHISme/Et8Qb1VK2MPfl5u9ivMls1u+la6+QYxjF1swCUUF9JqyJZbuceyfTCG5qVCH
         39GmmbdsU6v6DlYGGHss6C8/GNIb4jeoGHonY8lToJtAAa8IE3ieDZogIXWJgclc718l
         yBuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784542555; x=1785147355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ROvsO2TXFdYbrQp+Ap8Ei4+zcn6nTffqksbworVfOg8=;
        b=D9kKToE5eex89g/qfEZ+38jXqr2QIXICTyb5DKY2KIbEvtOxDpUIX9Kz8xrxN0RKrK
         mdHVII7cJ0rRV78OS3Va36Gt1TKavHqUaADf6C9rWLuBODotEPZNWnewYxxLZzT/Zi9Y
         bmMcFwE+7YnoqanwVVoBXvfKI6K2Jfbkxq/0Ve/hGglXYUWzPBqqInU3A53WQ81nTx7k
         fxRy//QchMtkFr+x0Hm4NE+yQLhOCcJUtp80VZR9FpfuLmG4NNbS94tmP4AdSEOMc7+J
         N86fMZ/1k+dWME9tTm5aVkY0DNR46Iwp1/mdxQvIY6EpJ7qRjqKtS2n1Ubvw5++WFz5O
         +ljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542555; x=1785147355;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROvsO2TXFdYbrQp+Ap8Ei4+zcn6nTffqksbworVfOg8=;
        b=A0+NIDGGoyWJP0MIEUvxqUSevqz7oB0CTvxEnMxZpTXkMI0Xr+RGWBh5O+xW49nZbF
         ukZMBTX8IenocV+bVhjOZ1ObqjnCGW02EbAHSXIO3+EEUtpZNCSKBMNO/cuPgWhU53TL
         KQdNbTI2RDZJsXs832eFSzb48aogFwfDv+rxCOHnSbtvavp8Lll9Ax8FbgolBVMFYfzm
         5JGbYHTY1IFDTRPSb3kmW4FrLA7gnobPRM0TY+qLDaNT93X/vpRWw1+E6lo21e2sLPxj
         x3cFavlj9E0ui6zQl/verWsjOWQNFUOya2Pn1pq44ZzAc3+Ei4MaGwkAyrSpPoaH82bN
         7NKw==
X-Forwarded-Encrypted: i=1; AHgh+RpNyjUema4P6RAitvTP+WlavHLm1EfEpJaU//nwmbTcVdM2cp03ei67ZriBcJSE0Dh0RHKSnvLWtJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGVp7lPs7Gl/YdkOOqEAi1n/L7Cxd6Z8SzlCNBz7G6g5UoUSdA
	UKZo3f1frPBnh+o/ZaAHJDlG7DULdjqhyq/f+pmS5k9HhhMv6PIpvfBdMhgqiJfKUDr0v1NCodp
	FGrHnBFGlln6xwtGO3QAx3G4fwz1ldjWHdfVv/hBfd2v6Tf83W7ZzfhellXNP/BMRL8NGH4k1jk
	ptwh4Ls7vxo7kXCEWFNnple6mslaxzL6ZxsKGdZg==
X-Gm-Gg: AfdE7clkjfJz54m5LjgWt0W4HFFi/ZXNGwnO+yPjGZSYDPRnVLATuNo1jX412vm92JX
	8MdD1u02iNOTzA9MOgE9EauFWp9/sfViXARSAo6NG0bIGbE0OKPNjSlw3uVbOKmgBbOY1KJP43y
	+4N1sp0jMdMT1sQ5Ek4sXSyI00AeksCUlwMHgN0o4LXMqiYREk7V4EANkH2GuzoRo3IiHC1K5Dw
	2nyt9F6OQrkEFR1gJcv5toNNeW7qN14rvcsjYmN4kU0/sy+VYbx+feRIX9xokfSf+E0GpVZV8E=
X-Received: by 2002:a05:620a:294b:b0:92e:c117:5edf with SMTP id af79cd13be357-930b41ce063mr1236848085a.75.1784542554804;
        Mon, 20 Jul 2026 03:15:54 -0700 (PDT)
X-Received: by 2002:a05:620a:294b:b0:92e:c117:5edf with SMTP id
 af79cd13be357-930b41ce063mr1236841985a.75.1784542554085; Mon, 20 Jul 2026
 03:15:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-csi_formatter-v13-0-4dc9a80e4cfd@oss.nxp.com> <20260720-csi_formatter-v13-3-4dc9a80e4cfd@oss.nxp.com>
In-Reply-To: <20260720-csi_formatter-v13-3-4dc9a80e4cfd@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 12:15:42 +0200
X-Gm-Features: AUfX_mztDTKJmpo_rMo3uLL3pj7VS7ZqohVBag01gV7Lxq9YDwHPT44_dBb8Mhg
Message-ID: <CAFEp6-0vK4cBsfztp2-RXpD2UDWaLNMznXCpNBLep2T+3RtPyw@mail.gmail.com>
Subject: Re: [PATCH v13 3/3] media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Frank Li <frank.li@nxp.com>, "Bryan O'Donoghue" <bod@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: hIHZDQpN0-xN0t_w6QK6lOKKSE1bDCO0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDExNCBTYWx0ZWRfXzhMF01+5zvCL
 wpPWzUlaBkQBCWWSoBxkqhuB8Eo4T69h2Xv6aKgLSWIiyfIj7Txuwzt/0SWyxG+OO1Vd9NcFe7H
 QeCjVQaG0tjcRgrK/2V+9cpcbhDbUm06DtV9p2nmPxyZn1cQFitXUSWNHGVrplS2OL/Ev4Mc9aD
 KcRsn5GxSZcZmTXFhl90q9zJk8E6omXnweKUL0tVyhyyxpJwuBocsrD9smxA/rbiY173S48UUEw
 bp0noVIihP6WLAvFdqtymzn8MQ6hF3MqTk4/ZVbxqHKgR3XRdi/LCp2psOgOkBxgbtlZaLyfkO4
 YZTOSwprxWGljdNtuP74/rn6HUGUFE1LP1akCHLeduLc7fuUfuF6nRBTycqyvbpl9E0B7qq791C
 jQtUYvO510zBDuLejFx2l0XvUeasEoHG5PUlla+la2lqJ0s2fXZA5o47FR2o3vK7vAmI5RY/QIr
 DPpKbGeBJOl3r8TH+pQ==
X-Authority-Analysis: v=2.4 cv=RPmD2Yi+ c=1 sm=1 tr=0 ts=6a5df55b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=UJRJXqoc3iRmL-dUjgAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: hIHZDQpN0-xN0t_w6QK6lOKKSE1bDCO0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDExNCBTYWx0ZWRfX0MbbWoZFVs+4
 PM87vwWKhsYwz92cYCe2ruFAoBcp+7/9sITgOVihKg1GLWN+0PnwoksIaiaOngH2xJSVKg7L05s
 mztTyuoUUCM1K4kW05daxRnvNWDFTbk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200114

On Mon, Jul 20, 2026 at 11:56=E2=80=AFAM <guoniu.zhou@oss.nxp.com> wrote:
>
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The CSI pixel formatter is a module found on i.MX95 used to reformat
> packet info, pixel and non-pixel data from CSI-2 host controller to
> match Pixel Link(PL) definition.
>
> Add data formatting support.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Looks good to me but if you're planning another version, I'd recommend
using devm_pm_clk_create(dev) together with of_pm_clk_add_clks(dev)
and relying on the generic PM clock infrastructure instead of handling
the clocks explicitly in the driver.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Changes in v13:
> - Replace pr_warn_once() with dev_warn() in csi_formatter_get_index_by_dt=
()
>   to provide device context and warn on every occurrence (Loic)
> - Add WARN_ON() check for csi_formatter_find_format() return value in
>   start/stop_stream functions to catch unexpected NULL (Loic)
> - Use regmap_set_bits()/regmap_clear_bits() instead of read-modify-write
>   pattern and remove unused csi_formatter_read/write helper functions (Lo=
ic)
> - Add Reviewed-by tag from Frank Li
>
> Changes in v12:
> - Fix stream ID handling: iterate routing table instead of assuming
>   stream ID equals loop index (0-7)
> - Remove stream_to_vc[] array: derive VC from routing table and frame
>   descriptor on each start/stop operation
> - Remove V4L2_SUBDEV_FL_HAS_EVENTS flag since driver does not generate ev=
ents
> - Support stream IDs 0-63 by using BIT_ULL() for stream masks
> - Add get_frame_desc call in stop_stream with proper error handling
> - Add csi_formatter_read() helper function for register reads
> - Use read-modify-write for CSI_VC_PIXEL_DATA_TYPE register to support
>   multiplexed streams sharing the same virtual channel
> - Use route->sink_pad instead of hardcoded CSI_FORMATTER_PAD_SINK
> - Write back coerced format in set_fmt before propagating to source strea=
m
> - Drop Frank's Reviewed-by tag due to significant changes, requesting re-=
review
>
> Changes in v10:
> - Use u8 for vc in csi_formatter_get_vc() and drop vc < 0 check
> - Add MFD_SYSCON dependency to Kconfig
> - Fix stream/VC mapping potential mismatch in start/stop_stream functions
>
> Changes in v8:
> - Remove fmt field and look up format from subdev state instead
> - Unify function and structure naming to use csi_formatter_ prefix
> - Remove misleading alignment comment from set_fmt function
> - Optimize get_frame_desc to call once per start_stream
> - Replace V4L2_FRAME_DESC_ENTRY_MAX with CSI_FORMATTER_VC_NUM in loops
> - Remove redundant debug message in enable_streams
> - Use MEDIA_PAD_FL_MUST_CONNECT flag instead of manual link check
> - Fix typo: Formater -> Formatter in Kconfig help text
> - Improve grammar in data type index mapping comment
>
> Changes in v7:
> - Update references from imx9 to imx95 for consistency with dt-bindings
> - Enable PM runtime before async registration
>
> Changes in v6:
> - Remove unused header includes
> - Unify macro naming: VCx/VCX -> VC and parameter x -> vc
> - Remove unused format field from csi_formatter struct
> - Use compact initialization for formats array
> - Make find_csi_format() return NULL instead of default format
> - Use unsigned int for array index in find_csi_format()
> - Add err_ prefix to error handling labels
> - Add v4l2_subdev_cleanup() and reorder cleanup sequence
> - Update enable_streams debug output format
> - Rename VC_MAX to VC_NUM and fix boundary check
> - Update CSI formatter Kconfig description
> - Use v4l2_subdev_get_frame_desc_passthrough() helper
> - Fix error paths in async registration and probe
> - Add mutex to protect enabled_streams
> - Switch to devm_pm_runtime_enable()
> - Remove redundant num_routes check in set_routing
> - Optimize get_index_by_dt() and add warning for unsupported type
> - csi_formatter_start/stop_stream: Process all streams in mask
> ---
>  MAINTAINERS                                      |   8 +
>  drivers/media/platform/nxp/Kconfig               |  15 +
>  drivers/media/platform/nxp/Makefile              |   1 +
>  drivers/media/platform/nxp/imx95-csi-formatter.c | 808 +++++++++++++++++=
++++++
>  4 files changed, 832 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index efbf808063e5..05009228b162 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19275,6 +19275,14 @@ S:     Maintained
>  F:     Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
>  F:     drivers/media/platform/nxp/imx-jpeg
>
> +NXP i.MX 95 CSI PIXEL FORMATTER V4L2 DRIVER
> +M:     Guoniu Zhou <guoniu.zhou@nxp.com>
> +L:     imx@lists.linux.dev
> +L:     linux-media@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.y=
aml
> +F:     drivers/media/platform/nxp/imx95-csi-formatter.c
> +
>  NXP i.MX CLOCK DRIVERS
>  M:     Abel Vesa <abelvesa@kernel.org>
>  R:     Peng Fan <peng.fan@nxp.com>
> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/=
nxp/Kconfig
> index 40e3436669e2..8f49908b0022 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -28,6 +28,21 @@ config VIDEO_IMX8MQ_MIPI_CSI2
>           Video4Linux2 driver for the MIPI CSI-2 receiver found on the i.=
MX8MQ
>           SoC.
>
> +config VIDEO_IMX95_CSI_FORMATTER
> +       tristate "NXP i.MX95 CSI Pixel Formatter driver"
> +       depends on ARCH_MXC || COMPILE_TEST
> +       depends on MFD_SYSCON
> +       depends on VIDEO_DEV
> +       select MEDIA_CONTROLLER
> +       select V4L2_FWNODE
> +       select VIDEO_V4L2_SUBDEV_API
> +       help
> +         This driver provides support for the CSI Pixel Formatter found =
on
> +         i.MX95 series SoCs. This module unpacks the pixels received fro=
m the
> +         CSI-2 interface and reformats them to meet pixel link requireme=
nts.
> +
> +         Say Y here to enable CSI Pixel Formatter module for i.MX95 SoC.
> +
>  config VIDEO_IMX_MIPI_CSIS
>         tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 m=
odels"
>         depends on ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform=
/nxp/Makefile
> index 4d90eb713652..6410115d870e 100644
> --- a/drivers/media/platform/nxp/Makefile
> +++ b/drivers/media/platform/nxp/Makefile
> @@ -6,6 +6,7 @@ obj-y +=3D imx8-isi/
>
>  obj-$(CONFIG_VIDEO_IMX7_CSI) +=3D imx7-media-csi.o
>  obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) +=3D imx8mq-mipi-csi2.o
> +obj-$(CONFIG_VIDEO_IMX95_CSI_FORMATTER) +=3D imx95-csi-formatter.o
>  obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) +=3D imx-mipi-csis.o
>  obj-$(CONFIG_VIDEO_IMX_PXP) +=3D imx-pxp.o
>  obj-$(CONFIG_VIDEO_MX2_EMMAPRP) +=3D mx2_emmaprp.o
> diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c b/drivers/m=
edia/platform/nxp/imx95-csi-formatter.c
> new file mode 100644
> index 000000000000..b0e8e753e94a
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx95-csi-formatter.c
> @@ -0,0 +1,808 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include <media/mipi-csi2.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +
> +/* CSI Pixel Formatter registers map */
> +
> +#define CSI_VC_INTERLACED_LINE_CNT(vc)         (0x00 + (vc) * 0x04)
> +#define INTERLACED_ODD_LINE_CNT_SET(x)         FIELD_PREP(GENMASK(13, 0)=
, (x))
> +#define INTERLACED_EVEN_LINE_CNT_SET(x)                FIELD_PREP(GENMAS=
K(29, 16), (x))
> +
> +#define CSI_VC_INTERLACED_CTRL                 0x20
> +
> +#define CSI_VC_INTERLACED_ERR                  0x24
> +#define CSI_VC_ERR_MASK                                GENMASK(7, 0)
> +#define CSI_VC_ERR(vc)                         BIT((vc))
> +
> +#define CSI_VC_YUV420_FIRST_LINE_EVEN          0x28
> +#define YUV420_FIRST_LINE_EVEN(vc)             BIT((vc))
> +
> +#define CSI_RAW32_CTRL                         0x30
> +#define CSI_VC_RAW32_MODE(vc)                  BIT((vc))
> +#define CSI_VC_RAW32_SWAP_MODE(vc)             BIT((vc) + 8)
> +
> +#define CSI_STREAM_FENCING_CTRL                        0x34
> +#define CSI_VC_STREAM_FENCING(vc)              BIT((vc))
> +#define CSI_VC_STREAM_FENCING_RST(vc)          BIT((vc) + 8)
> +
> +#define CSI_STREAM_FENCING_STS                 0x38
> +#define CSI_STREAM_FENCING_STS_MASK            GENMASK(7, 0)
> +
> +#define CSI_VC_NON_PIXEL_DATA_TYPE(vc)         (0x40 + (vc) * 0x04)
> +
> +#define CSI_VC_PIXEL_DATA_CTRL(vc)             (0x60 + (vc) * 0x04)
> +#define NEW_VC(vc)                             FIELD_PREP(GENMASK(3, 1),=
 vc)
> +#define REROUTE_VC_ENABLE                      BIT(0)
> +
> +#define CSI_VC_ROUTE_PIXEL_DATA_TYPE(vc)       (0x80 + (vc) * 0x04)
> +
> +#define CSI_VC_NON_PIXEL_DATA_CTRL(vc)         (0xa0 + (vc) * 0x04)
> +
> +#define CSI_VC_PIXEL_DATA_TYPE(vc)             (0xc0 + (vc) * 0x04)
> +
> +#define CSI_VC_PIXEL_DATA_TYPE_ERR(vc)         (0xe0 + (vc) * 0x04)
> +
> +#define CSI_FORMATTER_PAD_SINK                 0
> +#define CSI_FORMATTER_PAD_SOURCE               1
> +#define CSI_FORMATTER_PAD_NUM                  2
> +
> +#define CSI_FORMATTER_VC_NUM                   8 /* Number of virtual ch=
annels */
> +
> +struct csi_formatter_pix_format {
> +       u32 code;
> +       u32 data_type;
> +};
> +
> +struct csi_formatter {
> +       struct device *dev;
> +       struct regmap *regs;
> +       struct clk *clk;
> +
> +       struct v4l2_subdev sd;
> +       struct v4l2_subdev *csi_sd;
> +       struct v4l2_async_notifier notifier;
> +       struct media_pad pads[CSI_FORMATTER_PAD_NUM];
> +
> +       u32 remote_pad;
> +       u32 reg_offset;
> +
> +       /* Protects enabled_streams */
> +       struct mutex lock;
> +       u64 enabled_streams;
> +};
> +
> +struct csi_formatter_dt_index {
> +       u8 dtype;
> +       u8 index;
> +};
> +
> +/*
> + * The index corresponds to the bit index in the register that enables
> + * the data type of pixel data transported by the Formatter.
> + */
> +static const struct csi_formatter_dt_index formatter_dt_to_index_map[] =
=3D {
> +       { .dtype =3D MIPI_CSI2_DT_YUV420_8B,        .index =3D 0 },
> +       { .dtype =3D MIPI_CSI2_DT_YUV420_8B_LEGACY, .index =3D 2 },
> +       { .dtype =3D MIPI_CSI2_DT_YUV422_8B,        .index =3D 6 },
> +       { .dtype =3D MIPI_CSI2_DT_RGB444,           .index =3D 8 },
> +       { .dtype =3D MIPI_CSI2_DT_RGB555,           .index =3D 9 },
> +       { .dtype =3D MIPI_CSI2_DT_RGB565,           .index =3D 10 },
> +       { .dtype =3D MIPI_CSI2_DT_RGB666,           .index =3D 11 },
> +       { .dtype =3D MIPI_CSI2_DT_RGB888,           .index =3D 12 },
> +       { .dtype =3D MIPI_CSI2_DT_RAW6,             .index =3D 16 },
> +       { .dtype =3D MIPI_CSI2_DT_RAW7,             .index =3D 17 },
> +       { .dtype =3D MIPI_CSI2_DT_RAW8,             .index =3D 18 },
> +       { .dtype =3D MIPI_CSI2_DT_RAW10,            .index =3D 19 },
> +       { .dtype =3D MIPI_CSI2_DT_RAW12,            .index =3D 20 },
> +       { .dtype =3D MIPI_CSI2_DT_RAW14,            .index =3D 21 },
> +       { .dtype =3D MIPI_CSI2_DT_RAW16,            .index =3D 22 },
> +};
> +
> +static const struct csi_formatter_pix_format formats[] =3D {
> +       /* YUV formats */
> +       { MEDIA_BUS_FMT_UYVY8_1X16,     MIPI_CSI2_DT_YUV422_8B },
> +       /* RGB formats */
> +       { MEDIA_BUS_FMT_RGB565_1X16,    MIPI_CSI2_DT_RGB565 },
> +       { MEDIA_BUS_FMT_RGB888_1X24,    MIPI_CSI2_DT_RGB888 },
> +       /* RAW (Bayer and greyscale) formats */
> +       { MEDIA_BUS_FMT_SBGGR8_1X8,     MIPI_CSI2_DT_RAW8 },
> +       { MEDIA_BUS_FMT_SGBRG8_1X8,     MIPI_CSI2_DT_RAW8 },
> +       { MEDIA_BUS_FMT_SGRBG8_1X8,     MIPI_CSI2_DT_RAW8 },
> +       { MEDIA_BUS_FMT_SRGGB8_1X8,     MIPI_CSI2_DT_RAW8 },
> +       { MEDIA_BUS_FMT_Y8_1X8,         MIPI_CSI2_DT_RAW8 },
> +       { MEDIA_BUS_FMT_SBGGR10_1X10,   MIPI_CSI2_DT_RAW10 },
> +       { MEDIA_BUS_FMT_SGBRG10_1X10,   MIPI_CSI2_DT_RAW10 },
> +       { MEDIA_BUS_FMT_SGRBG10_1X10,   MIPI_CSI2_DT_RAW10 },
> +       { MEDIA_BUS_FMT_SRGGB10_1X10,   MIPI_CSI2_DT_RAW10 },
> +       { MEDIA_BUS_FMT_Y10_1X10,       MIPI_CSI2_DT_RAW10 },
> +       { MEDIA_BUS_FMT_SBGGR12_1X12,   MIPI_CSI2_DT_RAW12 },
> +       { MEDIA_BUS_FMT_SGBRG12_1X12,   MIPI_CSI2_DT_RAW12 },
> +       { MEDIA_BUS_FMT_SGRBG12_1X12,   MIPI_CSI2_DT_RAW12 },
> +       { MEDIA_BUS_FMT_SRGGB12_1X12,   MIPI_CSI2_DT_RAW12 },
> +       { MEDIA_BUS_FMT_Y12_1X12,       MIPI_CSI2_DT_RAW12 },
> +       { MEDIA_BUS_FMT_SBGGR14_1X14,   MIPI_CSI2_DT_RAW14 },
> +       { MEDIA_BUS_FMT_SGBRG14_1X14,   MIPI_CSI2_DT_RAW14 },
> +       { MEDIA_BUS_FMT_SGRBG14_1X14,   MIPI_CSI2_DT_RAW14 },
> +       { MEDIA_BUS_FMT_SRGGB14_1X14,   MIPI_CSI2_DT_RAW14 },
> +       { MEDIA_BUS_FMT_SBGGR16_1X16,   MIPI_CSI2_DT_RAW16 },
> +       { MEDIA_BUS_FMT_SGBRG16_1X16,   MIPI_CSI2_DT_RAW16 },
> +       { MEDIA_BUS_FMT_SGRBG16_1X16,   MIPI_CSI2_DT_RAW16 },
> +       { MEDIA_BUS_FMT_SRGGB16_1X16,   MIPI_CSI2_DT_RAW16 },
> +};
> +
> +static const struct v4l2_mbus_framefmt formatter_default_fmt =3D {
> +       .code =3D MEDIA_BUS_FMT_UYVY8_1X16,
> +       .width =3D 1920U,
> +       .height =3D 1080U,
> +       .field =3D V4L2_FIELD_NONE,
> +       .colorspace =3D V4L2_COLORSPACE_SMPTE170M,
> +       .xfer_func =3D V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SMPTE17=
0M),
> +       .ycbcr_enc =3D V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SMPTE17=
0M),
> +       .quantization =3D V4L2_QUANTIZATION_LIM_RANGE,
> +};
> +
> +static const struct csi_formatter_pix_format *csi_formatter_find_format(=
u32 code)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(formats); i++)
> +               if (code =3D=3D formats[i].code)
> +                       return &formats[i];
> +
> +       return NULL;
> +}
> +
> +/* ---------------------------------------------------------------------=
--------
> + * V4L2 subdev operations
> + */
> +
> +static inline struct csi_formatter *sd_to_formatter(struct v4l2_subdev *=
sdev)
> +{
> +       return container_of(sdev, struct csi_formatter, sd);
> +}
> +
> +static int __csi_formatter_subdev_set_routing(struct v4l2_subdev *sd,
> +                                             struct v4l2_subdev_state *s=
tate,
> +                                             struct v4l2_subdev_krouting=
 *routing)
> +{
> +       int ret;
> +
> +       ret =3D v4l2_subdev_routing_validate(sd, routing,
> +                                          V4L2_SUBDEV_ROUTING_ONLY_1_TO_=
1);
> +       if (ret)
> +               return ret;
> +
> +       return v4l2_subdev_set_routing_with_fmt(sd, state, routing,
> +                                               &formatter_default_fmt);
> +}
> +
> +static int csi_formatter_subdev_init_state(struct v4l2_subdev *sd,
> +                                          struct v4l2_subdev_state *sd_s=
tate)
> +{
> +       struct v4l2_subdev_route routes[] =3D {
> +               {
> +                       .sink_pad =3D CSI_FORMATTER_PAD_SINK,
> +                       .sink_stream =3D 0,
> +                       .source_pad =3D CSI_FORMATTER_PAD_SOURCE,
> +                       .source_stream =3D 0,
> +                       .flags =3D V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +               },
> +       };
> +
> +       struct v4l2_subdev_krouting routing =3D {
> +               .num_routes =3D ARRAY_SIZE(routes),
> +               .routes =3D routes,
> +       };
> +
> +       return __csi_formatter_subdev_set_routing(sd, sd_state, &routing)=
;
> +}
> +
> +static int csi_formatter_subdev_enum_mbus_code(struct v4l2_subdev *sd,
> +                                              struct v4l2_subdev_state *=
sd_state,
> +                                              struct v4l2_subdev_mbus_co=
de_enum *code)
> +{
> +       if (code->pad =3D=3D CSI_FORMATTER_PAD_SOURCE) {
> +               struct v4l2_mbus_framefmt *fmt;
> +
> +               if (code->index > 0)
> +                       return -EINVAL;
> +
> +               fmt =3D v4l2_subdev_state_get_format(sd_state, code->pad,
> +                                                  code->stream);
> +               code->code =3D fmt->code;
> +               return 0;
> +       }
> +
> +       if (code->index >=3D ARRAY_SIZE(formats))
> +               return -EINVAL;
> +
> +       code->code =3D formats[code->index].code;
> +
> +       return 0;
> +}
> +
> +static int csi_formatter_subdev_set_fmt(struct v4l2_subdev *sd,
> +                                       struct v4l2_subdev_state *sd_stat=
e,
> +                                       struct v4l2_subdev_format *sdform=
at)
> +{
> +       struct csi_formatter_pix_format const *format;
> +       struct v4l2_mbus_framefmt *fmt;
> +
> +       if (sdformat->pad =3D=3D CSI_FORMATTER_PAD_SOURCE)
> +               return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
> +
> +       format =3D csi_formatter_find_format(sdformat->format.code);
> +       if (!format)
> +               format =3D &formats[0];
> +
> +       v4l_bound_align_image(&sdformat->format.width, 1, 0xffff, 2,
> +                             &sdformat->format.height, 1, 0xffff, 0, 0);
> +
> +       fmt =3D v4l2_subdev_state_get_format(sd_state, sdformat->pad,
> +                                          sdformat->stream);
> +       *fmt =3D sdformat->format;
> +
> +       /* Set default code if user set an invalid value */
> +       fmt->code =3D format->code;
> +       sdformat->format =3D *fmt;
> +
> +       /* Propagate the format from sink stream to source stream */
> +       fmt =3D v4l2_subdev_state_get_opposite_stream_format(sd_state, sd=
format->pad,
> +                                                          sdformat->stre=
am);
> +       if (!fmt)
> +               return -EINVAL;
> +
> +       *fmt =3D sdformat->format;
> +
> +       return 0;
> +}
> +
> +static int csi_formatter_subdev_set_routing(struct v4l2_subdev *sd,
> +                                           struct v4l2_subdev_state *sta=
te,
> +                                           enum v4l2_subdev_format_whenc=
e which,
> +                                           struct v4l2_subdev_krouting *=
routing)
> +{
> +       if (which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE &&
> +           media_entity_is_streaming(&sd->entity))
> +               return -EBUSY;
> +
> +       return __csi_formatter_subdev_set_routing(sd, state, routing);
> +}
> +
> +static u8 csi_formatter_get_index_by_dt(struct csi_formatter *formatter,
> +                                       u8 data_type)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(formatter_dt_to_index_map); ++i) {
> +               const struct csi_formatter_dt_index *entry =3D
> +                       &formatter_dt_to_index_map[i];
> +
> +               if (data_type =3D=3D entry->dtype)
> +                       return entry->index;
> +       }
> +
> +       dev_warn(formatter->dev, "Unsupported data type 0x%x, using defau=
lt\n",
> +                data_type);
> +
> +       return formatter_dt_to_index_map[0].index;
> +}
> +
> +static int csi_formatter_get_vc(struct csi_formatter *formatter,
> +                               struct v4l2_mbus_frame_desc *fd,
> +                               unsigned int stream)
> +{
> +       struct v4l2_mbus_frame_desc_entry *entry =3D NULL;
> +       unsigned int i;
> +       u8 vc;
> +
> +       for (i =3D 0; i < fd->num_entries; ++i) {
> +               if (fd->entry[i].stream =3D=3D stream) {
> +                       entry =3D &fd->entry[i];
> +                       break;
> +               }
> +       }
> +
> +       if (!entry) {
> +               dev_err(formatter->dev,
> +                       "No frame desc entry for stream %u\n", stream);
> +               return -EPIPE;
> +       }
> +
> +       vc =3D entry->bus.csi2.vc;
> +
> +       if (vc >=3D CSI_FORMATTER_VC_NUM) {
> +               dev_err(formatter->dev, "Invalid virtual channel %u\n", v=
c);
> +               return -EINVAL;
> +       }
> +
> +       return vc;
> +}
> +
> +static void csi_formatter_stop_stream(struct csi_formatter *formatter,
> +                                     struct v4l2_subdev_state *state,
> +                                     u64 stream_mask)
> +{
> +       const struct csi_formatter_pix_format *pix_fmt;
> +       struct v4l2_mbus_frame_desc fd =3D {};
> +       struct v4l2_subdev_route *route;
> +       struct v4l2_mbus_framefmt *fmt;
> +       unsigned int reg;
> +       unsigned int mask;
> +       int vc;
> +       int ret;
> +
> +       ret =3D v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
> +                              formatter->remote_pad, &fd);
> +       if (ret < 0 && ret !=3D -ENOIOCTLCMD) {
> +               dev_err(formatter->dev, "Failed to get frame desc: %d\n",=
 ret);
> +               return;
> +       }
> +
> +       for_each_active_route(&state->routing, route) {
> +               if (route->source_pad !=3D CSI_FORMATTER_PAD_SOURCE)
> +                       continue;
> +
> +               if (!(stream_mask & BIT_ULL(route->source_stream)))
> +                       continue;
> +
> +               if (ret =3D=3D -ENOIOCTLCMD) {
> +                       /*
> +                        * Source doesn't implement get_frame_desc, use
> +                        * default VC 0
> +                        */
> +                       vc =3D 0;
> +               } else {
> +                       vc =3D csi_formatter_get_vc(formatter, &fd,
> +                                                 route->sink_stream);
> +                       if (vc < 0)
> +                               continue;
> +               }
> +
> +               fmt =3D v4l2_subdev_state_get_format(state, route->sink_p=
ad,
> +                                                  route->sink_stream);
> +
> +               pix_fmt =3D csi_formatter_find_format(fmt->code);
> +               if (WARN_ON(!pix_fmt))
> +                       continue;
> +
> +               reg =3D CSI_VC_PIXEL_DATA_TYPE(vc) + formatter->reg_offse=
t;
> +               mask =3D BIT(csi_formatter_get_index_by_dt(formatter,
> +                                                        pix_fmt->data_ty=
pe));
> +
> +               /* Clear the data type bit to disable this VC */
> +               regmap_clear_bits(formatter->regs, reg, mask);
> +       }
> +}
> +
> +static int csi_formatter_start_stream(struct csi_formatter *formatter,
> +                                     struct v4l2_subdev_state *state,
> +                                     u64 stream_mask)
> +{
> +       const struct csi_formatter_pix_format *pix_fmt;
> +       struct v4l2_subdev_route *route;
> +       struct v4l2_mbus_framefmt *fmt;
> +       struct v4l2_mbus_frame_desc fd =3D {};
> +       u64 configured_streams =3D 0;
> +       unsigned int reg;
> +       unsigned int mask;
> +       int vc;
> +       int ret;
> +
> +       ret =3D v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
> +                              formatter->remote_pad, &fd);
> +       if (ret < 0 && ret !=3D -ENOIOCTLCMD) {
> +               dev_err(formatter->dev, "Failed to get frame desc: %d\n",=
 ret);
> +               return ret;
> +       }
> +
> +       for_each_active_route(&state->routing, route) {
> +               if (route->source_pad !=3D CSI_FORMATTER_PAD_SOURCE)
> +                       continue;
> +
> +               if (!(stream_mask & BIT_ULL(route->source_stream)))
> +                       continue;
> +
> +               if (ret =3D=3D -ENOIOCTLCMD) {
> +                       /*
> +                        * Source doesn't implement get_frame_desc, use
> +                        * default VC 0
> +                        */
> +                       vc =3D 0;
> +               } else {
> +                       vc =3D csi_formatter_get_vc(formatter, &fd,
> +                                                 route->sink_stream);
> +                       if (vc < 0) {
> +                               ret =3D vc;
> +                               goto err_cleanup;
> +                       }
> +               }
> +
> +               fmt =3D v4l2_subdev_state_get_format(state, route->sink_p=
ad,
> +                                                  route->sink_stream);
> +
> +               pix_fmt =3D csi_formatter_find_format(fmt->code);
> +               if (WARN_ON(!pix_fmt)) {
> +                       ret =3D -EINVAL;
> +                       goto err_cleanup;
> +               }
> +
> +               reg =3D CSI_VC_PIXEL_DATA_TYPE(vc) + formatter->reg_offse=
t;
> +               mask =3D BIT(csi_formatter_get_index_by_dt(formatter,
> +                                                        pix_fmt->data_ty=
pe));
> +
> +               /* Set the data type bit to enable this VC */
> +               regmap_set_bits(formatter->regs, reg, mask);
> +
> +               configured_streams |=3D BIT_ULL(route->source_stream);
> +       }
> +
> +       return 0;
> +
> +err_cleanup:
> +       csi_formatter_stop_stream(formatter, state, configured_streams);
> +       return ret;
> +}
> +
> +static int csi_formatter_subdev_enable_streams(struct v4l2_subdev *sd,
> +                                              struct v4l2_subdev_state *=
state,
> +                                              u32 pad, u64 streams_mask)
> +{
> +       struct csi_formatter *formatter =3D sd_to_formatter(sd);
> +       struct device *dev =3D formatter->dev;
> +       u64 sink_streams;
> +       int ret;
> +
> +       sink_streams =3D v4l2_subdev_state_xlate_streams(state,
> +                                                      CSI_FORMATTER_PAD_=
SOURCE,
> +                                                      CSI_FORMATTER_PAD_=
SINK,
> +                                                      &streams_mask);
> +       if (!sink_streams || !streams_mask)
> +               return -EINVAL;
> +
> +       guard(mutex)(&formatter->lock);
> +
> +       if (!formatter->enabled_streams) {
> +               ret =3D pm_runtime_resume_and_get(formatter->dev);
> +               if (ret < 0) {
> +                       dev_err(dev, "Failed to resume runtime PM: %d\n",=
 ret);
> +                       return ret;
> +               }
> +       }
> +
> +       ret =3D csi_formatter_start_stream(formatter, state, streams_mask=
);
> +       if (ret)
> +               goto err_runtime_put;
> +
> +       ret =3D v4l2_subdev_enable_streams(formatter->csi_sd,
> +                                        formatter->remote_pad,
> +                                        sink_streams);
> +       if (ret)
> +               goto err_stop_stream;
> +
> +       formatter->enabled_streams |=3D streams_mask;
> +
> +       return 0;
> +
> +err_stop_stream:
> +       csi_formatter_stop_stream(formatter, state, streams_mask);
> +err_runtime_put:
> +       if (!formatter->enabled_streams)
> +               pm_runtime_put(formatter->dev);
> +       return ret;
> +}
> +
> +static int csi_formatter_subdev_disable_streams(struct v4l2_subdev *sd,
> +                                               struct v4l2_subdev_state =
*state,
> +                                               u32 pad, u64 streams_mask=
)
> +{
> +       struct csi_formatter *formatter =3D sd_to_formatter(sd);
> +       u64 sink_streams;
> +       int ret;
> +
> +       sink_streams =3D v4l2_subdev_state_xlate_streams(state,
> +                                                      CSI_FORMATTER_PAD_=
SOURCE,
> +                                                      CSI_FORMATTER_PAD_=
SINK,
> +                                                      &streams_mask);
> +       if (!sink_streams || !streams_mask)
> +               return -EINVAL;
> +
> +       guard(mutex)(&formatter->lock);
> +
> +       ret =3D v4l2_subdev_disable_streams(formatter->csi_sd, formatter-=
>remote_pad,
> +                                         sink_streams);
> +       if (ret)
> +               dev_err(formatter->dev, "Failed to disable streams: %d\n"=
, ret);
> +
> +       csi_formatter_stop_stream(formatter, state, streams_mask);
> +
> +       formatter->enabled_streams &=3D ~streams_mask;
> +
> +       if (!formatter->enabled_streams)
> +               pm_runtime_put(formatter->dev);
> +
> +       return ret;
> +}
> +
> +static const struct v4l2_subdev_pad_ops formatter_subdev_pad_ops =3D {
> +       .enum_mbus_code         =3D csi_formatter_subdev_enum_mbus_code,
> +       .get_fmt                =3D v4l2_subdev_get_fmt,
> +       .set_fmt                =3D csi_formatter_subdev_set_fmt,
> +       .get_frame_desc         =3D v4l2_subdev_get_frame_desc_passthroug=
h,
> +       .set_routing            =3D csi_formatter_subdev_set_routing,
> +       .enable_streams         =3D csi_formatter_subdev_enable_streams,
> +       .disable_streams        =3D csi_formatter_subdev_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_ops formatter_subdev_ops =3D {
> +       .pad =3D &formatter_subdev_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops formatter_internal_ops =3D =
{
> +       .init_state =3D csi_formatter_subdev_init_state,
> +};
> +
> +/* ---------------------------------------------------------------------=
--------
> + * Media entity operations
> + */
> +
> +static const struct media_entity_operations formatter_entity_ops =3D {
> +       .link_validate  =3D v4l2_subdev_link_validate,
> +       .get_fwnode_pad =3D v4l2_subdev_get_fwnode_pad_1_to_1,
> +};
> +
> +static int csi_formatter_subdev_init(struct csi_formatter *formatter)
> +{
> +       struct v4l2_subdev *sd =3D &formatter->sd;
> +       int ret;
> +
> +       v4l2_subdev_init(sd, &formatter_subdev_ops);
> +
> +       snprintf(sd->name, sizeof(sd->name), "%s", dev_name(formatter->de=
v));
> +       sd->internal_ops =3D &formatter_internal_ops;
> +
> +       sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
> +                    V4L2_SUBDEV_FL_STREAMS;
> +       sd->entity.function =3D MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> +       sd->entity.ops =3D &formatter_entity_ops;
> +       sd->dev =3D formatter->dev;
> +
> +       formatter->pads[CSI_FORMATTER_PAD_SINK].flags =3D MEDIA_PAD_FL_SI=
NK
> +                                                     | MEDIA_PAD_FL_MUST=
_CONNECT;
> +       formatter->pads[CSI_FORMATTER_PAD_SOURCE].flags =3D MEDIA_PAD_FL_=
SOURCE;
> +
> +       ret =3D media_entity_pads_init(&sd->entity, CSI_FORMATTER_PAD_NUM=
,
> +                                    formatter->pads);
> +       if (ret) {
> +               dev_err(formatter->dev, "Failed to init pads\n");
> +               return ret;
> +       }
> +
> +       ret =3D v4l2_subdev_init_finalize(sd);
> +       if (ret)
> +               media_entity_cleanup(&sd->entity);
> +
> +       return ret;
> +}
> +
> +static inline struct csi_formatter *
> +notifier_to_csi_formatter(struct v4l2_async_notifier *n)
> +{
> +       return container_of(n, struct csi_formatter, notifier);
> +}
> +
> +static int csi_formatter_notify_bound(struct v4l2_async_notifier *notifi=
er,
> +                                     struct v4l2_subdev *sd,
> +                                     struct v4l2_async_connection *asc)
> +{
> +       const unsigned int link_flags =3D MEDIA_LNK_FL_IMMUTABLE
> +                                     | MEDIA_LNK_FL_ENABLED;
> +       struct csi_formatter *formatter =3D notifier_to_csi_formatter(not=
ifier);
> +       struct v4l2_subdev *sdev =3D &formatter->sd;
> +       struct media_pad *sink =3D &sdev->entity.pads[CSI_FORMATTER_PAD_S=
INK];
> +       struct media_pad *remote_pad;
> +       int ret;
> +
> +       formatter->csi_sd =3D sd;
> +
> +       dev_dbg(formatter->dev, "Bound subdev: %s pad\n", sd->name);
> +
> +       ret =3D v4l2_create_fwnode_links_to_pad(sd, sink, link_flags);
> +       if (ret < 0)
> +               return ret;
> +
> +       remote_pad =3D media_pad_remote_pad_first(sink);
> +       if (!remote_pad) {
> +               dev_err(formatter->dev, "Pipe not setup correctly\n");
> +               return -EPIPE;
> +       }
> +       formatter->remote_pad =3D remote_pad->index;
> +
> +       return 0;
> +}
> +
> +static const struct v4l2_async_notifier_operations formatter_notify_ops =
=3D {
> +       .bound =3D csi_formatter_notify_bound,
> +};
> +
> +static int csi_formatter_async_register(struct csi_formatter *formatter)
> +{
> +       struct device *dev =3D formatter->dev;
> +       struct v4l2_async_connection *asc;
> +       int ret;
> +
> +       struct fwnode_handle *ep __free(fwnode_handle) =3D
> +               fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> +                                               FWNODE_GRAPH_ENDPOINT_NEX=
T);
> +       if (!ep)
> +               return -ENOTCONN;
> +
> +       v4l2_async_subdev_nf_init(&formatter->notifier, &formatter->sd);
> +
> +       asc =3D v4l2_async_nf_add_fwnode_remote(&formatter->notifier, ep,
> +                                             struct v4l2_async_connectio=
n);
> +       if (IS_ERR(asc)) {
> +               ret =3D PTR_ERR(asc);
> +               goto err_cleanup_notifier;
> +       }
> +
> +       formatter->notifier.ops =3D &formatter_notify_ops;
> +
> +       ret =3D v4l2_async_nf_register(&formatter->notifier);
> +       if (ret)
> +               goto err_cleanup_notifier;
> +
> +       ret =3D v4l2_async_register_subdev(&formatter->sd);
> +       if (ret)
> +               goto err_unregister_notifier;
> +
> +       return 0;
> +
> +err_unregister_notifier:
> +       v4l2_async_nf_unregister(&formatter->notifier);
> +err_cleanup_notifier:
> +       v4l2_async_nf_cleanup(&formatter->notifier);
> +       return ret;
> +}
> +
> +static void csi_formatter_async_unregister(struct csi_formatter *formatt=
er)
> +{
> +       v4l2_async_unregister_subdev(&formatter->sd);
> +       v4l2_async_nf_unregister(&formatter->notifier);
> +       v4l2_async_nf_cleanup(&formatter->notifier);
> +}
> +
> +/* ---------------------------------------------------------------------=
--------
> + * Suspend/resume
> + */
> +
> +static int csi_formatter_runtime_suspend(struct device *dev)
> +{
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct csi_formatter *formatter =3D sd_to_formatter(sd);
> +
> +       clk_disable_unprepare(formatter->clk);
> +
> +       return 0;
> +}
> +
> +static int csi_formatter_runtime_resume(struct device *dev)
> +{
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct csi_formatter *formatter =3D sd_to_formatter(sd);
> +
> +       return clk_prepare_enable(formatter->clk);
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(csi_formatter_pm_ops,
> +                                csi_formatter_runtime_suspend,
> +                                csi_formatter_runtime_resume, NULL);
> +
> +static int csi_formatter_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct csi_formatter *formatter;
> +       u32 val;
> +       int ret;
> +
> +       formatter =3D devm_kzalloc(dev, sizeof(*formatter), GFP_KERNEL);
> +       if (!formatter)
> +               return -ENOMEM;
> +
> +       formatter->dev =3D dev;
> +
> +       ret =3D devm_mutex_init(dev, &formatter->lock);
> +       if (ret)
> +               return ret;
> +
> +       formatter->regs =3D syscon_node_to_regmap(dev->parent->of_node);
> +       if (IS_ERR(formatter->regs))
> +               return dev_err_probe(dev, PTR_ERR(formatter->regs),
> +                                    "Failed to get csi formatter regmap\=
n");
> +
> +       ret =3D of_property_read_u32(dev->of_node, "reg", &val);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to get csi formatter reg pro=
perty\n");
> +
> +       formatter->reg_offset =3D val;
> +
> +       formatter->clk =3D devm_clk_get(dev, NULL);
> +       if (IS_ERR(formatter->clk))
> +               return dev_err_probe(dev, PTR_ERR(formatter->clk),
> +                                    "Failed to get pixel clock\n");
> +
> +       ret =3D csi_formatter_subdev_init(formatter);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "Failed to initialize form=
atter subdev\n");
> +
> +       platform_set_drvdata(pdev, &formatter->sd);
> +
> +       /* Enable runtime PM. */
> +       ret =3D devm_pm_runtime_enable(dev);
> +       if (ret)
> +               goto err_cleanup_subdev;
> +
> +       ret =3D csi_formatter_async_register(formatter);
> +       if (ret < 0) {
> +               dev_err_probe(dev, ret, "Failed to register async subdevi=
ce\n");
> +               goto err_cleanup_subdev;
> +       }
> +
> +       return 0;
> +
> +err_cleanup_subdev:
> +       v4l2_subdev_cleanup(&formatter->sd);
> +       media_entity_cleanup(&formatter->sd.entity);
> +       return ret;
> +}
> +
> +static void csi_formatter_remove(struct platform_device *pdev)
> +{
> +       struct v4l2_subdev *sd =3D platform_get_drvdata(pdev);
> +       struct csi_formatter *formatter =3D sd_to_formatter(sd);
> +
> +       csi_formatter_async_unregister(formatter);
> +
> +       v4l2_subdev_cleanup(&formatter->sd);
> +       media_entity_cleanup(&formatter->sd.entity);
> +}
> +
> +static const struct of_device_id csi_formatter_of_match[] =3D {
> +       { .compatible =3D "fsl,imx95-csi-formatter" },
> +       { /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, csi_formatter_of_match);
> +
> +static struct platform_driver csi_formatter_device_driver =3D {
> +       .driver =3D {
> +               .name           =3D "csi-pixel-formatter",
> +               .of_match_table =3D csi_formatter_of_match,
> +               .pm             =3D pm_ptr(&csi_formatter_pm_ops),
> +       },
> +       .probe  =3D csi_formatter_probe,
> +       .remove =3D csi_formatter_remove,
> +};
> +
> +module_platform_driver(csi_formatter_device_driver);
> +
> +MODULE_AUTHOR("NXP Semiconductor, Inc.");
> +MODULE_DESCRIPTION("NXP i.MX95 CSI Pixel Formatter driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>
