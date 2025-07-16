Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D7C1A841F
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752671854; cv=none; b=Vcl1d4Hv5GR5RZ9bhK5r8CQ/QBjrs+cqwKnghqbobG0jYURGL6e/I6JR3ilJm8it6MZXse87v1guLIz0sJSrKF/ASXClkHZ+Xv6ahogB0YhfyFYx2lN/5ZTXbKwJSq3ID/zMsaEj6todWfTrMA+a1eONiIw+dxJnAhQ7iB/+Nxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752671854; c=relaxed/simple;
	bh=+y29NeVOBvS8lwVbW73/GO/PmKB5z+3LYWdiFAbRspY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cih0mRbAHP/hTylLm+nCLF/44u7zuQwZCB0JD7vyG6XWGnQHxrQHOXtP5pRTmPeiM0DUCTSwOiF+GEuUTFPfvcGfpETLUtcc8UcBr/EUbQIO9Q2DMc6PfmX5Cy3JKSI7S6Q6omYAfCL3vuOs2AIVYP/18eIU/MNZLk9y3+tCXLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=L4+LjlpZ; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="L4+LjlpZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1752671843; x=1752931043;
	bh=+y29NeVOBvS8lwVbW73/GO/PmKB5z+3LYWdiFAbRspY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=L4+LjlpZujmtpqZwspxzMCOoLWoiSL9jIjlO1y8A7cJxhkCg2goRu//2VPwFuFgIX
	 82giJ+DkBEA4QBobBDppoNIz9a0IiV4MswZNSnlhzM+gQ1bZ1KSCUYhoONr15zGPEa
	 EK+v/mUGQWfOZBAZTT173UnzL+XOxQuoJf5lT4B+xdZEM/CdAppdJLA9uhitzPfoC+
	 E0/o6KVZoSrNmRlvWckl2rn/isfAp7kYUvfenDml31+sn2S3E4vSvxh9ao2rp2neAj
	 l7o4uNz2CwmwiicMnEWHqOeP/1779xGbZD9DgXBxs8w1diDlCcyGnf5GpVOKFfrAKl
	 l5ZiGWELIwaCQ==
Date: Wed, 16 Jul 2025 13:17:15 +0000
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 00/15] Add dt-bindings and dtsi changes for CAMSS on x1e80100 silicon
Message-ID: <493ebe8d-6f5c-44b3-8a34-fb2690981598@nxsw.ie>
In-Reply-To: <a58f2e68-41fa-4bed-9282-deb5e5435f4f@linaro.org>
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org> <9361e954-e2c9-41c6-be4c-12b0e4f367f5@linaro.org> <ae0a309f-7e52-4d3c-8f26-989f22da5b07@linaro.org> <GbVC82h7wSXQsAJh8XybKorKYy9wupjQLndjf_uYNXOZnk1UqS_tT4Yg9gzf8X3Kn55Mt5bXfcFrHtyMoFZ4-A==@protonmail.internalid> <a4ebdf5c-8d4f-4994-afd9-22c8d889fe97@linaro.org> <4281887a-e7c0-43bc-9e72-96f0e432c58f@nxsw.ie> <f753f088-474b-41bb-82d3-6684bea2f87e@linaro.org> <85c1a702-1a3a-4145-8f2b-240d61d6e72a@linaro.org> <a58f2e68-41fa-4bed-9282-deb5e5435f4f@linaro.org>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 3f084ee1dd1eec5dff5c34164eade933bd69dae4
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 15/07/2025 16:25, Vladimir Zapolskiy wrote:
> On 7/15/25 16:22, Bryan O'Donoghue wrote:
>> On 15/07/2025 14:08, Vladimir Zapolskiy wrote:
>>>>> It's quite easy, sensors are not connected to CSIDs. Moreover data fl=
ows
>>>>> from any sensor can be processed on any CSID, there is no static
>>>>> hardware
>>>>> links, which are attempted to be introduced.
>>>>
>>>> This statement is not correct.
>>>
>>> Please elaborate, what statement above is not correct?
>>
>> "static hardware links, which are attempted to be introduced"
>>
>> No such static hardware link is being attempted to be introduced, that
>> statement is incorrect or a misunderstanding of the intention.
>>
>>>
>>>> The port@ in CAMSS pertains to the camss-csiphy device not to the
>>>> camss-csid device, so there is no hard link to any specific CSID in th=
e
>>>> dts scheme here.
>>>
>>> And here it's just a confirmation that my statement above is correct,
>>> so please be consistent, and especially in any kind of accusations like
>>> you've just given above.
>>
>> Sorry Vlad I don't see much basis litigating this further.
>>
>> I've been very clear, I think we should have standalone CSIPHYs, there's
>> no reason to bury them inside of the CAMSS block - see CCI.
>=20
> I've never insisted on embedded CSIPHY device tree nodes under CAMSS
> device tree node, and I don't argue with it, it's kind of a red herring.

The point is moving the endpoint data from sensor to consumer, its=20
entirely up to us in the driver if camss-csiphy.c acts on that data,=20
camss-csid.c acts on that data or as we have at the moment camss.c acts=20
on the data.

> Can you please write this comment on the relevant series discussion?
>=20
> https://lore.kernel.org/all/bed8c29c-1365-4005-aac7-1635a28295bf@linaro.o=
rg/

This series is the response.
>> There's a clear way to do endpoints established from sensor to consumer,
>> there's no reason to give that data to the above CSIPHY driver, it has
>> no "use case" for it.
>=20
> Please don't ignore a different opinion shared by Konrad or me:
>=20
> https://lore.kernel.org/linux-media/427548c0-b0e3-4462-a15e-bd7843f00c7f@=
oss.qualcomm.com/
>=20
> It's unclear why this particular device tree properties are going to be
> added into some different device tree node. Since somebody made an effort
> to spot and discuss it, please share your brought effort as well.
>=20
> Unfortunately your series does not look technically correct due to the
> given reason, there should be a mitigation, and the defence in form of
> "it's been done always this (presumably wrong) way and shall be continued
> to be done this (presumably wrong) way" is barely acceptable.

I still don't really get what your technical objection is.

- Separate CSIPHY nodes
- Data consumer for the endpoint of the sensor

is pretty common practice, I've provided the citations.

There is no user of the endpoints in the CSIPHY hardware, nothing to do=20
with it, adding code in there to facilitate it is meaningless churn.

The amount of dancing required in CAMSS to support PHYs as subdevices of=20
the main block is needless, there's a more sustainable less "weird" way=20
to do this as evidenced by multiple upstream sources.

Rather than repeating the legacy code in hdmi/dsi we should take current=20
best practices re: the very nice collabra thread I pointed to for Rockchip.

Anyway we can discuss this some more in v8.

---
bod

