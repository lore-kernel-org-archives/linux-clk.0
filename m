Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB2B3D75AB;
	Wed, 29 Jul 2026 20:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785357119; cv=none; b=i2KLdADZZcMeoYuO0gir9ic+ud3HA7gWuP/hh0/ogFWCKMAUl8jypMJCH0Ev+4bkG9op42hDK71WjczNuysKh04FqQfL/NMnh8r9eb9m3iy7NcTRlfYxDXmMmxCiBcmqtTRxZ5BL+E1A3s7mOBUr6xqjO6LSumJYY+FUALpH4ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785357119; c=relaxed/simple;
	bh=TpOPqPM0yfsdY+T7EN3hGc701SXFTUjQWJ3JCuJ9oQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6TmN93A9Pphxf20/6JnG9htuXKEfpgWxW0nqrLc3ZtL3JUISwm5cb+7aMDrPl1lrKEVaJJvapmWlX+wtM6tJT5rHP8XR9WSsePlpDonGUWFT56iTP3yLmFxiq02H+y1UScGIxijOTHvuMG65kp/AzFLmm2kFFJdOvZ/H4L8pQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=elZPAY36; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="elZPAY36"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80641F000E9;
	Wed, 29 Jul 2026 20:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785357117;
	bh=4aKy79id/k5rZYSRIjBweFs5AzGWuqksrl9M8jcvWk4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=elZPAY36keHsXlXbFM49u2/CGDTiCOzc9LZxYhN++GrWR+B0kFSZIEJONUae3EwAn
	 hqjAH+kNh22vazH6aptgsmGWJezWZn0/bBGjQT9/kCihF4tvRekiuGY8FbUo5++lQV
	 g7PqZ2evyhq/hLHKvNvN1En5GzVI0epdVZ/FRxh3ynsIVEtp6ij+5AMF+0n/lVZG/s
	 ol5b+F7rLdOseq4TTxOHKagodTg2vYfuV07E+zg/Z+JM3eNTEK6Ckw7vZpDX9AYrRf
	 2eQL91UZAnu149Ej4LcblBCa6GhUGdVXmP7qBI6GdzX+trPAJSFwahtuzApj7ip1L4
	 E9d/F8AoTC4nA==
Message-ID: <25ef6b91-62b4-4e8e-bc8f-8400dc293273@kernel.org>
Date: Wed, 29 Jul 2026 21:31:50 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/5] media: qcom: camss: Add support for PHY API
 devices
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
 <qTmyhh5ukxu4BQAZXvNyyUvZxucwjv6bNoe2v30cfjsdhuzg3ud5DZzGmSBlYICc_POjXS2sSvhbRop0i67mxg==@protonmail.internalid>
 <8210513c-288b-4d02-9688-1de10e40d9f9@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <8210513c-288b-4d02-9688-1de10e40d9f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/07/2026 14:45, Nihal Kumar Gupta wrote:
> 
> 
> On 28-07-2026 15:05, Bryan O'Donoghue wrote:
>> +				ret = PTR_ERR(csd);
>> +				goto err_cleanup;
>> +			}
>> +		}
>> +
>>   		if (IS_ERR(csd)) {
>>   			ret = PTR_ERR(csd);
>>   			goto err_cleanup;
>> @@ -4819,6 +4854,29 @@ static int camss_parse_ports(struct camss *camss)
>>   	return ret;
>>   }
> Hi Bryan,
> 
> While rebasing Glymur on the following series I found an issue —
> Could you please review the changes below.
> 
> Tested on
> 1. Glymur CRD with OV08X40, working as expected.
> 2. Monaco EVK with IMX577(legacy path) — working as expected.
> 
> Picked up following for testing:
> - PHY driver:     Add a CSI2 MIPI DPHY driver [v14]
> - CAMSS PHY API:  Add dt-bindings and PHY updates for CAMSS on x1e80100 silicon [v13]
> - Below patchset
> - Glymur DT binding/DTS: locally
> 
> Holding off formal submission until the above stabilise.
> 
> ----------------------------------------------------------------------
>  From b86af6812bb655e885dbcd23ffd28c92177017cd Mon Sep 17 00:00:00 2001
> From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Date: Wed, 29 Jul 2026 18:18:54 +0530
> Subject: [PATCH] media: qcom: camss: Read lane config from PHY endpoint for
>   PHY API path
> 
> In the new PHY API topology the CAMSS endpoint carries only port/ID
> information. The bus-type and data-lane configuration are described on
> the PHY node's sensor-side endpoint (port@0), not on the CAMSS endpoint.

So I don't think this model is in-keep with established DT practices - 
if a driver needs to parse a property it needs to have that property in 
the device node it handles.

So with data-lanes per existing camss bindings in the IFE/CSID node 
everything though should work as-is for you.

https://gitlab.com/Linaro/arm64-laptops/linux/-/tree/arm64-laptops-v7.2-rc2-camss-v11?ref_type=heads

https://gitlab.com/Linaro/arm64-laptops/linux/-/blob/arm64-laptops-v7.2-rc2-camss-v11/arch/arm64/boot/dts/qcom/x1-crd.dtsi?ref_type=heads#L947

&camss {
	status = "okay";

	ports {
		/*
		 * port0 => csiphy0
		 * port1 => csiphy1
		 * port2 => csiphy2
		 * port3 => csiphy4
		 */
		port@3 {
			camss_csiphy4_inep: endpoint {
				data-lanes = <0 1 2 3>;
				remote-endpoint = <&csiphy4_out_ep>;
			};
		};
	};
};

&cci1 {
	status = "okay";
};

&cci1_i2c1 {
	camera@36 {
		compatible = "ovti,ov08x40";
		reg = <0x36>;

		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
		pinctrl-0 = <&cam_rgb_default>;
		pinctrl-names = "default";

		clocks = <&camcc CAM_CC_MCLK4_CLK>;
		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
		assigned-clock-rates = <19200000>;

		orientation = <0>; /* front facing */

		avdd-supply = <&vreg_l7b_2p8>;
		dovdd-supply = <&vreg_l3m_1p8>;

		port {
			ov08x40_out_ep: endpoint {
				data-lanes = <1 2 3 4>;
				link-frequencies = /bits/ 64 <400000000>;
				remote-endpoint = <&csiphy4_in_ep>;
			};
		};
	};
};

&csiphy4 {
	vdda-0p9-supply = <&vreg_l2c_0p8>;
	vdda-1p2-supply = <&vreg_l1c_1p2>;

	status = "okay";

	ports {
		#address-cells = <1>;
		#size-cells = <0>;

		port@0 {
			reg = <0>;
			csiphy4_in_ep: endpoint {
				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
				data-lanes = <0 1 2 3>;
				remote-endpoint = <&ov08x40_out_ep>;
			};
		};

		port@1 {
			reg = <1>;
			csiphy4_out_ep: endpoint {
				remote-endpoint = <&camss_csiphy4_inep>;
			};
		};
	};
};


> Add a phy_in parameter to camss_parse_endpoint_node(). Extract csiphy_id
> from the CAMSS endpoint port number and read bus-type and lane properties
> from phy_in. Check fwnode_device_is_available() on the PHY node and skip
> disabled PHYs. Fix missing fwnode_handle_put() on the disabled-PHY early
> exit path. For legacy DTS phy_in is the CAMSS endpoint itself so existing
> behaviour is preserved.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 49 +++++++++++++++++------
>   1 file changed, 36 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 84097d82d99c..7254f2b28eb0 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4742,11 +4742,13 @@ static const struct parent_dev_ops vfe_parent_dev_ops = {
>    */
>   static int camss_parse_endpoint_node(struct device *dev,
>   				     struct fwnode_handle *ep,
> +				     struct fwnode_handle *phy_in,
>   				     struct camss_async_subdev *csd)
>   {
>   	struct csiphy_lanes_cfg *lncfg = &csd->interface.csi2.lane_cfg;
>   	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
>   	struct v4l2_fwnode_endpoint vep = { { 0 } };
> +	struct v4l2_fwnode_endpoint phy_vep = { { 0 } };
>   	unsigned int i;
>   	int ret;
> 
> @@ -4754,18 +4756,26 @@ static int camss_parse_endpoint_node(struct device *dev,
>   	if (ret)
>   		return ret;
> 
> +	csd->interface.csiphy_id = vep.base.port;
> +
> +	/* bus-type and lane config from csiphy endpoint (phy_in) */
> +	ret = v4l2_fwnode_endpoint_parse(phy_in, &phy_vep);
> +	if (ret) {
> +		dev_err(dev, "parse_endpoint: failed to parse phy_in ep (%pfw): %d\n",
> +			phy_in, ret);
> +		return ret;
> +	}
> +
>   	/*
>   	 * Most SoCs support both D-PHY and C-PHY standards, but currently only
>   	 * D-PHY is supported in the driver.
>   	 */
> -	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
> -		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
> +	if (phy_vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
> +		dev_err(dev, "Unsupported bus type %d\n", phy_vep.bus_type);
>   		return -EINVAL;
>   	}
> 
> -	csd->interface.csiphy_id = vep.base.port;
> -
> -	mipi_csi2 = &vep.bus.mipi_csi2;
> +	mipi_csi2 = &phy_vep.bus.mipi_csi2;
>   	lncfg->clk.pos = mipi_csi2->clock_lane;
>   	lncfg->clk.pol = mipi_csi2->lane_polarities[0];
>   	lncfg->num_data = mipi_csi2->num_data_lanes;
> @@ -4798,15 +4808,15 @@ static int camss_parse_ports(struct camss *camss)
> 
>   	fwnode_graph_for_each_endpoint(fwnode, ep) {
>   		struct camss_async_subdev *csd;
> -
> -		if (!fwnode_device_is_available(ep))
> -			continue;
> +		struct fwnode_handle *phy_in;
> 
>   		if (camss->legacy_phy) {
>   			csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
>   							      typeof(*csd));
> +			/* legacy DTS has bus-type/data-lanes on the camss endpoint */
> +			phy_in = fwnode_handle_get(ep);
>   		} else {
> -			struct fwnode_handle *phy_out, *phy_node, *phy_in, *sensor_ep;
> +			struct fwnode_handle *phy_out, *phy_node, *sensor_ep;
> 
>   			phy_out = fwnode_graph_get_remote_endpoint(ep);
>   			if (!phy_out)
> @@ -4817,31 +4827,44 @@ static int camss_parse_ports(struct camss *camss)
>   			if (!phy_node)
>   				continue;
> 
> +			if (!fwnode_device_is_available(phy_node)) {
> +				dev_info(dev, "parse_ports: phy_node=%s disabled\n",
> +				 of_node_full_name(to_of_node(phy_node)));
> +				continue;
> +			};

This is a correct change I can take into my patch - I'll add you down as 
Co-developed by.

> +
> +			/* port@0 of the phy node is the sensor-side input port */
>   			phy_in = fwnode_graph_get_endpoint_by_id(phy_node, 0, 0, 0);
>   			fwnode_handle_put(phy_node);
> -			if (!phy_in)
> +			if (!phy_in) {
> +				dev_info(dev, "parse_ports: csiphy port@0 has no endpoint, skip\n");
>   				continue;
> +			};
> 
>   			sensor_ep = fwnode_graph_get_remote_endpoint(phy_in);
> -			fwnode_handle_put(phy_in);
> -			if (!sensor_ep)
> +			if (!sensor_ep) {
> +				fwnode_handle_put(phy_in);
>   				continue;
> +			};
> 
>   			csd = v4l2_async_nf_add_fwnode(&camss->notifier, sensor_ep,
>   						struct camss_async_subdev);
>   			fwnode_handle_put(sensor_ep);
>   			if (IS_ERR(csd)) {
> +				fwnode_handle_put(phy_in);
>   				ret = PTR_ERR(csd);
>   				goto err_cleanup;
>   			}
>   		}
> 
>   		if (IS_ERR(csd)) {
> +			fwnode_handle_put(phy_in);
>   			ret = PTR_ERR(csd);
>   			goto err_cleanup;
>   		}
> 
> -		ret = camss_parse_endpoint_node(dev, ep, csd);
> +		ret = camss_parse_endpoint_node(dev, ep, phy_in, csd);
> +		fwnode_handle_put(phy_in);
>   		if (ret < 0)
>   			goto err_cleanup;
>   	}
> --
> 2.34.1

