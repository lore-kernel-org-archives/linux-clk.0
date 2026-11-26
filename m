Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726779;
	b=Mj5P4L0zPykRsM87joIrATz6snHm8OPonImPTPCVCa16XxJwc2XJVL6L2xr3kOQMgdjV
	 /LTA7eQbsd6zVz+OwGT/i5rMbcvtrnVMx0EdAs1e5h7Im0sDWBy96xgkfM6JugD73Rc0q
	 dxLAoVLcmoA/099BFZtswyZij4ZCVl1MTsPoKaos6gSqyhEF71UcZ8srDDjso3ntgrN3h
	 3HaHMS86SFnxOBJbQ4l03RDLu1bK/BHNaD36+jpoWUxGxy+G3lzVkA2L4QbhFWup1wU6n
	 4B6NvhWr0Q0FWzJwdyaUqI4+jMKtZJcp3Fx/sZtwl10c0EE4wHcWxFi7Ta8lhSuSasA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726779;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=43FuZlAs6POCjvZrAHbbrpryok64HGMb+mhfMxJg5sU=;
	b=gPCtkkD+v3r2+0fbol2lBM9lOSEjCZm5Pt8Fo57YDl3T2kQQpKTMu9vzDkC7aUU1XbXz
	 yuNDg0CkpVHXZxanQBhr3BEdGiWn/r8RC6k+3CA/HEXUXo/mBOzoV/vpqUjn/Gxovd1Ov
	 kmqiJrZRk/nykATxa5othPVtFmIvJniySblbVGtnKL+ns20MzwfvTnXbLNcgzPuoMz+ad
	 t14WbUDiIzfL5UtOOg4Mj85NK/LBHyMEb9YYsbXZLtroHS1+pxy8rT23zg2oGjyhwq/pI
	 TFxWqAg2L5VNLPyRjixLHL/1mNqBfK1Ak/9DKLisr0vikHgonHNmydzyfy3d2diA7RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EZlrpj+q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C26E606A31C;
	Thu, 26 Nov 2026 20:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EZlrpj+q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F4A1F000C1;
	Thu, 26 Nov 2026 20:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795726779;
	bh=43FuZlAs6POCjvZrAHbbrpryok64HGMb+mhfMxJg5sU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=EZlrpj+qCyV5jdtbCYTu+wtwLbjxPX0rXbtu7iIULy30wKGiuwwqW6icaY1xnf5CR
	 CaP2w2ejg1oQVeV79DRobEAfKlZY7PPxdK9hTIXqD2YF1MBoduPA4/NLGN+op5SVsL
	 v69Het4VX4rC/7gyXzad4MubX1F4/Ju7/vFXSmG/YlsPKbslXI5C6mqLt+zZ27woI1
	 69Mwcrk5WkPPk4l09e+EDuu3qgNUSY4I1ap5s0/qCTCDHHlNoWAEKsgYjJeU+xZaby
	 j59UynoouuNRkMPLST4+qKagPf0SWu2hA7wR0QROrNoqSqyzmeHwGFT1K6iG5Ts3Xj
	 P37WGlPu2BeXw==
Message-ID: <15b5029d-e1c4-4978-b602-48ff32c3400c@kernel.org>
Date: Thu, 26 Nov 2026 22:59:35 +0200
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
Subject: Re: [PATCH v4 15/16] ARM: dts: microchip: sam9x60_curiosity: Enable
 OTP Controller
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-16-ada@thorsis.com>
 <1d45ab58-9e5a-4b9f-adc4-691a99f0e05e@kernel.org>
 <20261119-gaming-employed-e2f29d4756aa@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20261119-gaming-employed-e2f29d4756aa@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Alexandre,

On 11/19/26 17:17, Alexander Dahl wrote:
> Hello Claudiu,
> 
> Am Sun, Nov 15, 2026 at 04:27:35PM +0200 schrieb Claudiu Beznea:
>>
>>
>> On 11/5/26 13:06, Alexander Dahl wrote:
>>> Allows to access the OTP memory and Product UID now.
>>>
>>> Signed-off-by: Alexander Dahl<ada@thorsis.com>
>>
>> Reviewed-by: Claudiu Beznea <claudiu.beznea@kernel.org>
> 
> Well, in feedback to v4 sashiko suggested [1] it is not necessary to
> enable the node in board dts, because the node is implicitly enabled
> already in SoC dtsi.  Can confirm this from testing.  I would therefor
> drop this patch for v5 of the series.  Or is it better to keep it to
> make it explicit?

Unless this node is critical for the SoC to work (I think it is not), let's keep 
it disabled in the SoC dtsi and enable it in the board dts file.

Thank you,
Claudiu
