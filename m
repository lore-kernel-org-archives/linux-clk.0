Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3474A35E1AA
	for <linux-clk@vger.kernel.org>; Sun,  6 Sep 2026 15:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788709677; cv=none; b=Y+2IzbPc/xrT7SkIMXAup36RHV4uiWsmqt2yaG6T0mKPYNyhlz44aHRujn7+bk6miUjXha1vrvt+hu3RXmfjb7GUJzKJnQlRwnd2mGvllngFWDnjvquHlGIEZkleBA0buKKXkATw2lt+9+FYduDt8S9slwPgHTjGZlNo1Vt8G+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788709677; c=relaxed/simple;
	bh=Qq5Z9pdI3WCpDQKVL6vyoFgxWJ8z9w4v5ed7QbTfgYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nSEX/cyOy+BEJuzsWteiF8vLtTsopNqzFhBz/FiaF6e053oNGZTaRiOsn7sLG6Ktl+7rIm6+lWLaZR7LJUE1rvZwH25UEK3cdfDw9nXCharZ3siN07e4+g20XFQiAMqB5VRKNff+p8Lp7dAIf4w5GdZczPEZ7z+z1KMEf9ujT3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RiUod8Q+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZBiPUDzW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RiUod8Q+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZBiPUDzW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686EWCNW1300619
	for <linux-clk@vger.kernel.org>; Sun, 6 Sep 2026 15:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJuqbRAfLeuaHG3fQFZPvjkD3eLgn2ZlqMYozAYdRbo=; b=RiUod8Q+hPKtNg6q
	lOXnR+TICE5yki5olBYNDrHWNCOtU3q/IZRU3XGjns/3X9fkyzBofWf31R74XR6U
	7QMBQQwzUHhPY7MHjhAz3qaN+xo/T8A2zKHop0jI2DZNmu/shOcxnZfWWqwOUM9i
	d/kc8sJ4vnTNrnOzjAZEEY1mfgKIztlmGi5jc4jjYyLFrL0NhHbieSDUKVe7eUor
	qLjEKRl7OJ1B4+nur1BLBCarGbTTb0qKFUde1V6T6F1RDkDFQA8K3agv6v1uS4jb
	dx2DKBHCStVhzqRtK0s2Lgly1iVNlOBKRE/vbXNjL12mVJAPt2dtHxzgzocQpRWo
	BguGGw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggba3kqau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 06 Sep 2026 15:47:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso4363042b3a.1
        for <linux-clk@vger.kernel.org>; Sun, 06 Sep 2026 08:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788709675; x=1789314475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iJuqbRAfLeuaHG3fQFZPvjkD3eLgn2ZlqMYozAYdRbo=;
        b=ZBiPUDzWPvgLmOy95uMW+MXyndKbNU7sdT5xJhzMUGut4qabfOQ/1nfsez1uDVVLQm
         UzI6UyAeWl1ryLGN9uFoxItoRPLf+TbE9WfpQS8lshacUoazi9A8WDh94gjw94AYYJub
         faiPwP9IIQ+ZjM4AcuCSdpMd9wKIw1mvNflCyCA9GMHuZNG+PVRi7osGUSDB2csp3zDG
         KmUVpcj2qm42FxegZl3uhkj5lljGJH0nFDKK4ePpvTaJW4dD/vBlROCvqhDJDYmB7tHv
         NsEgGAihRZVp0+bxS0Cxfnjpp2cyhM64hkXM9nS2nBsoCsYEkqEsC9CCcf4u7JCGxAX/
         QD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788709675; x=1789314475;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJuqbRAfLeuaHG3fQFZPvjkD3eLgn2ZlqMYozAYdRbo=;
        b=f0nZgur134+vMNy5eMr4vrkmAL2sQvHaJ4liao6D2RlaRirt2Atb1+4PQUkZ86QNfV
         SuScECNuKezjsVq+fRwMTCo78hTo5wqIMNTK1YOFFxC7eOxtcgAKIVUDTmI6RFddV/d8
         5pVW1VMutgt0CUfn+HYwksoySScAX7R4LF1tMwhO3cQEmUJAwY7D89/WSRThnvIxJIBD
         4wrF5NxxJQsZr+al1xSwyOMUKqxlATZzzB+ZOt3MhnPIqelh+LeFEuwJy7NkldjvzkLy
         E6SEIa6l46LuOf6pC3RzoKPHk2nXIV8J3tDGlgUq/0HrBlckfFEy1+A2Z3N0hBxMGWor
         nGrg==
X-Forwarded-Encrypted: i=1; AKwUvBzD7+vdn4Cwa+LI7tcVPYhsoseDyy9gC3+ter2uVnnC9Uh5fp4FaBK2VMEaH87qTvtdDYZsQXwLt9o=@vger.kernel.org
X-Gm-Message-State: AFuF++nIGJFpIfiWE+XqM3mP7ggOQkilsGSkp0EJJ4CN2JoP3ohRc0cn
	/5Wc6eQexf6zY5cDUJbMly7+qtt68kBG4Hf05AgKw/boaLuKSfIuEEnzSA6ZMpxu/dYgPIz/l/a
	5dlSIP2zDMoITGoKXbrOusYAKfeMcpzoO+6Eoi5x0PpZuhlw1I9ajMnwFaTP5A1o=
X-Gm-Gg: AYBFou1lYS5VffbBlR2/+kdgzhS9G0GezG8wSu2tKCLXlbwI8LGdRlOG9VgITZiNCm7
	YZWvMbEXCSGsWuz4jSiIkrHiZ7zWgrRcVO307lOYCT+l4XG1Pzbb7Ov8Tu9EE7QJRvznyEG5zrI
	W5ARWeZz7mO5GefTUbEVVlAXht+R3K6W737DWtA6feLq9Bx+A3KamhEXCMzdbiT66ociKE3u6iq
	/0qpxnDDdy1I0gVtQstiban8MmbqMEnso8+h0ACNcBL6tn1Q8dtg+BAqQtmeGK2ded4lgnJdo+7
	AIO52HjFIXaoQ14vJ3X8jHm7sZwlKRPci6bTqk9i+Hv79qEgOuxtwE93Lw2l3J56/259vV9ViLF
	kSmrVn6OezUn3LFVKj6ULvphbKJWM
X-Received: by 2002:a05:6a21:8887:b0:3d3:3dca:f0a3 with SMTP id adf61e73a8af0-3da21418721mr21362731637.8.1788709674497;
        Sun, 06 Sep 2026 08:47:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:8887:b0:3d3:3dca:f0a3 with SMTP id adf61e73a8af0-3da21418721mr21362685637.8.1788709674052;
        Sun, 06 Sep 2026 08:47:54 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm20951125eec.12.2026.09.06.08.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 08:47:53 -0700 (PDT)
Message-ID: <b0089142-45eb-4cf7-be6f-45c9889b3756@oss.qualcomm.com>
Date: Sun, 6 Sep 2026 21:17:43 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 5/5] media: qcom: camss: Use data-lanes starting at 1
 for new CSIPHY mode
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-5-e2197a3e2551@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-5-e2197a3e2551@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE3NiBTYWx0ZWRfX6H3AElK5UEOb
 AknbknUd1L/XyqRp2XkWINDvDBo4tYJMoAVgFoXTI3MFdrew4Yta7ifBvfviIUORKs8sL6raEzZ
 xep+SJE3t2KwXNFJ+GkUI0jhYakSu84z2/UB9IdyOtU3Y0KsnP49VjucNdyVCiujnCMuHvVMIYp
 IxtbgxnO418TuK9sG2iiEFKINqBgVBhhvfJdmymzZHmRayarq4s7rNIJevKQ4pkVN6ibng5TLlA
 JznENMa/jm3Q03x9oymlI73tD1E5Il63+dB0HmKiE77UjyG6pD49i+iEt1ECGO32x8W/LQ+fa6T
 OEFAcPxBmGtkvHCYl7jMTM4EHMUR0ymdzFq6PsCjxBghxMK9usbaDqg/qSGi4MGVUB9vE/tBuhr
 L6ERQLY9WUdJrjlRj9ilGM0Uic0uVnnsAAgpQYkorBws3IJ+Rk3ce7F8F8fDajRDtNw3FH/jl0f
 8OuxirjU+SfSA1GaW3g==
X-Proofpoint-ORIG-GUID: VmRmonVKaqFFEpPRdW7-jFsmEHWwmkAL
X-Proofpoint-GUID: VmRmonVKaqFFEpPRdW7-jFsmEHWwmkAL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE3NiBTYWx0ZWRfX1t9/n7Zs3jrf
 SC6oDyxWCoLtC/YkJh0naiAyOxCummoIMcprHDu0ro+GyXj/TdZFDC8N6LCjvXc7Lxw/fwtNEcG
 giWcZM/PSjxMJk2L1XKi2qpD7Wum4ic=
X-Authority-Analysis: v=2.4 cv=Tf2mcxQh c=1 sm=1 tr=0 ts=6a9d8b2b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=HcLy/BXbbKFjgnJyaMb84Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=zWu_p7zOJ7ruh_JjBGAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-06_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060176



On 06-09-2026 19:47, Bryan O'Donoghue wrote:
> Introducing a dedicated CSIPHY driver community feedback was both to move
> to data-lanes starting at index 1 on the PHY side and also to match that
> indexing scheme in the CSI decoder - CSID.
> 
> CSID consumes the data-lanes property to determine which CSID lanes to
> switch on. For indexes starting at 1 we need to amend the logic somewhere.
> The PHY side code normalises the input data to register level meanings so,
> replicate that logic on the CSID side.
> 
> Introduce a simple flag to differentiate between legacy indexing @ 0 and
> new indexing @ 1.
> 
> Existing bindings are not affected.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 84097d82d99c9..07b3cddca5840 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4742,7 +4742,8 @@ static const struct parent_dev_ops vfe_parent_dev_ops = {
>   */
>  static int camss_parse_endpoint_node(struct device *dev,
>  				     struct fwnode_handle *ep,
> -				     struct camss_async_subdev *csd)
> +				     struct camss_async_subdev *csd,
> +				     u8 lane_base)
>  {
>  	struct csiphy_lanes_cfg *lncfg = &csd->interface.csi2.lane_cfg;
>  	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
> @@ -4777,7 +4778,14 @@ static int camss_parse_endpoint_node(struct device *dev,
>  		return -ENOMEM;
>  
>  	for (i = 0; i < lncfg->num_data; i++) {
> -		lncfg->data[i].pos = mipi_csi2->data_lanes[i];
> +		u8 lane = mipi_csi2->data_lanes[i];
> +
> +		if (lane < lane_base || lane - lane_base >= lncfg->num_data) {
> +			dev_err(dev, "invalid data-lane %u\n", lane);
> +			return -EINVAL;
> +		}
> +
> +		lncfg->data[i].pos = mipi_csi2->data_lanes[i] - lane_base;
>  		lncfg->data[i].pol = mipi_csi2->lane_polarities[i + 1];
>  	}
>  
> @@ -4794,6 +4802,7 @@ static int camss_parse_ports(struct camss *camss)
>  {
>  	struct device *dev = camss->dev;
>  	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
> +	u8 lane_base = camss->legacy_phy ? 0 : 1;
>  	int ret;
>  
>  	fwnode_graph_for_each_endpoint(fwnode, ep) {
> @@ -4841,7 +4850,7 @@ static int camss_parse_ports(struct camss *camss)
>  			goto err_cleanup;
>  		}
>  
> -		ret = camss_parse_endpoint_node(dev, ep, csd);
> +		ret = camss_parse_endpoint_node(dev, ep, csd, lane_base);
>  		if (ret < 0)
>  			goto err_cleanup;
>  	}
> 
Reviewed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur CRD

---
Regards,
Nihal Kumar Gupta
