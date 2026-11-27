Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795796066;
	b=U4LICDr/Cjmimequ+J+Uz7ENmcVYKVeU+klOXGJz+tpIgLEfpeeP3gFxD+Ty9TeNArEb
	 5UOU1SOEwoUV3eYrG281Q5kuIZps/ZuPaVsUn4U1aoKnzQZ73p3EExaqPrbLiYQrakZi0
	 naccDE/8DpJZfHvJdHljHi95ThHKX/WKKmZN8WalkxTzx5Rp8ZL7XwNrUaGdD8gCXY15o
	 n6oCeMbyb5irYHbccZNjkZy92p4+hugK8IuR0Q2BNisBg9DvVya4CAWO0avaALwxk4MOb
	 ZQK9xDoFjxDeiJj1h3g74EDz88jkEbnpX3DoYBzrk7cHAtQs3bEtj+TUh2qtFRjXRIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796066;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=PiMjljHAXEnxkN3fZddDPsELEz/91yYiiyEN+s6dHEs=;
	b=okz6STFi2qeJZpaEsp7TTcZ1TLK1f0IHnwY0an11sRTaf2r7pwydqwggPesV6V1FJMqE
	 1TUWcDccniZpRJi76GNAOD2j3XLxt1diSZWFsfZlIHXz3Flwzk0TRmIEWwMSMgjz/5zOy
	 bMOEM9qVrt8ohYlbta3g7frY+QkgJf31nysYrIDpYmDi3lJNRaIpUZyg0lWT0mNFMRDT9
	 EdsX+2PcHlhAdfIyMXlIX6gStvwElRrazGwjoKRwTwlej/QXK1Ekd7NvqOqbZCJri0Xgn
	 uufB5DvyaIdkxfJxe8cwuZiPB1vssQC6wuMlt7YolDvUH06m/5F6wdZ2JnNzPtaPV+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GN/zhOW0";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4A1606A31C;
	Fri, 27 Nov 2026 16:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GN/zhOW0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE891F00898;
	Fri, 27 Nov 2026 16:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795796066;
	bh=PiMjljHAXEnxkN3fZddDPsELEz/91yYiiyEN+s6dHEs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GN/zhOW0t/Dtz2TZSw9Gc4aXbaArAcBLAuNvI60Chq1Vyqgi9Z4UoJ2RfQN9DKmf7
	 xA5Uc8LCrZGkkoDfkCpYcLhV+JPn/wLLUOyvuPKiuF3JFWBfYYp0E/chumHr1lfhzf
	 W7W+/3lUdOVZrCdsNpP1Iuz5mgIaLolp6AsXz6qFIdrTlNX8+oiYTVmZKYWNGwlJv1
	 2eZigogyjhLpncCvdpOCkEBdbQc/22ZrjcsDsqBj7skDTG6aE4EG4UXBOSZu5tP1iW
	 Q+snHLR3V3dKhbMolZexgdDTvPDwRzU6CF1qvWQOu75RteTrwdO/TMY+3f4EHtPe67
	 ELfpKTgOJkF8g==
Message-ID: <012855be-7a95-436f-b0ab-11ae3134ced8@kernel.org>
Date: Fri, 27 Nov 2026 16:14:20 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] Enable front and rear cameras on Xiaomi Mi A1
 (tissot)
To: Hikmah Gumelar <hikmahgumelar@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
References: <__OIHsqpwOqb8kxVYcd2PoPvNYDhN8XO6vyXiYMCCK6o3sfyJ1gl1GNdhcGYhdfBf43tQmn6Dt6cWXcSD1uiPA==@protonmail.internalid>
 <20261127134507.125513-1-hikmahgumelar@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261127134507.125513-1-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/11/2026 13:45, Hikmah Gumelar wrote:
> This series enables the front (Samsung S5K5E8) and rear (OmniVision OV12A10)
> cameras on the Xiaomi Mi A1 (msm8953-xiaomi-tissot), along with the required
> MSM8953 CAMSS clock fix, sensor DT bindings, V4L2 subdev drivers, and SoC/board
> devicetree updates.
> 
> Changes in v5:
> - Restore missing `select V4L2_CCI_I2C` lines across existing camera sensor
>    entries in drivers/media/i2c/Kconfig.
> - Move ov12a10 Kconfig/Makefile entries from the s5k5e8 driver patch into the
>    ov12a10 driver patch to preserve per-commit bisectability, and add
>    MAINTAINERS entries for both bindings and drivers.
> - ov12a10: Call pm_runtime_enable() before registering the async subdev, add
>    v4l2_subdev_cleanup() in the probe error unwind path, update the active
>    subdev state and return -EBUSY when streaming in set_fmt, add the 35 ms
>    post-powerdown delay when reset_gpio is absent, and match the initial
>    V4L2_CID_EXPOSURE maximum (3372) to the default mode.
> - msm8953-xiaomi-tissot.dts: Move `vdd_l23-supply` inside the `regulators`
>    child node under `&rpm_requests`.
> - Include base-commit metadata via git format-patch --base.
> 
> Hikmah Gumelar (7):
>    clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
>    media: dt-bindings: media: i2c: add Samsung S5K5E8
>    media: i2c: add s5k5e8 image sensor driver
>    media: dt-bindings: media: i2c: add OmniVision OV12A10
>    media: i2c: add ov12a10 image sensor driver
>    arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
>    arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
I recommend breaking up your patches in three separate series.

1. s5k5e8
2. ov12a10
3. SoC depends

with #3 depending on #1 and #2. As is you need people to pick up patches 
individually within a series which is always tougher.

---
bod
