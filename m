Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795862134;
	b=mWIMi7hljIR1beHFiYNOrUNxVHvd2LGNHVSBxrO1DFfYRWwkv33ywccHIcizbDkmruSR
	 3QwHJJfh9UMyTCJQhjUsOuGSWHRxW5hrkcwB8deAxXYBI0Gi6yB3FEGLhGfvcHfs+PUgK
	 4uHkbNxpm8Xb5eVzDB9paNfPEEeI4uYMSmDUDaHisfPgEpr3xU/FL7RAZBdwA9XFnEn4t
	 ROmaqR5Qb9Cyy3hGS7+CNAc+AxdDl/argA8C977JgyLCsrccep2CrwDx692E1i2/uuu2+
	 r4j9lN0dxTXCPhsGNr9wSy46/c0tA+TZzVf8ccBMOzndOasIfvOd7/i+S094gK7DHTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795862134;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=aBKW1ICYNfGMQxVpp4JVetndoiFKYUuXJkf+oEE1yts=;
	b=yVnffCuU05zVbBWo/ZiFx1JBNQokjVVj69dWsbo33vrYdAfa2bVRIIYgkpDq6wt0cmmY
	 4acokskKQyl1z/tbAMYL7zRN6dPsgjAT+tKdxtsJFPu68w1T1irGV3TWVxkQa+q+qHxUv
	 1Nf3bjopUPri5B4NnzDq4fOyxdd3KA3SGcp/w0jfS9kwgQoDKLY1/ncv2EA4cgjhZz3lY
	 U2ybuKikTW2SMxNILEd1hcYc6deNxvuZUTlT0SPins7vGTMK9zweDHKQQc/P//nZugSZx
	 pYKLESmTo7a96+Dvdjr2Lip7Pacby+oIha72KX5jky2yfRSFMh6JnMTveZDxByvhIug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dNzl9tdV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C680B606A31C;
	Sat, 28 Nov 2026 10:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dNzl9tdV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36D31F00893;
	Sat, 28 Nov 2026 10:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795862134;
	bh=aBKW1ICYNfGMQxVpp4JVetndoiFKYUuXJkf+oEE1yts=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dNzl9tdVzSUIYBrBTWPJHgydoOT0aWXxW48ydh540XacM0M8/ff6Ja/mrCrK2pax2
	 E7O9QG7OZN9nZaTLszPCMTfnBOs5eczoJS6ZkmAf4HC7G5qoiIogjNpxJeBq+S52ci
	 asi3MBJz84Fz3FHasB/FYm1J2ENNuGeFltRjS82mAv3M1dN1qpYUp1qZ4qjj0xAKOa
	 iVN1Mnb+EY0DMAGENZNgVjPoU/VNb5WcL170zYZazqLBHCDNr1MgO7t5jVWnWuI/qD
	 JFtqd/wH2fTYaVR0wozgQhHXja5yjvrTPW52AuYrEXvnE1tk+kzZB/w0nmc3Bwx379
	 JcC+TQuivibkw==
Message-ID: <efc24aac-70f6-439a-8d5d-2de1dcce9821@kernel.org>
Date: Sat, 28 Nov 2026 10:35:29 +0000
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
To: Hikmah Gumelar <hikmahgumelar@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abelvesa@kernel.org>
References: <__OIHsqpwOqb8kxVYcd2PoPvNYDhN8XO6vyXiYMCCK6o3sfyJ1gl1GNdhcGYhdfBf43tQmn6Dt6cWXcSD1uiPA==@protonmail.internalid>
 <20261127134507.125513-1-hikmahgumelar@gmail.com>
 <012855be-7a95-436f-b0ab-11ae3134ced8@kernel.org>
 <usmhiLIDutYU2qMwKDA2JD_eerKmIm1DhH1J9mWHtDxq6fV84KcRoeen48y1ll_FanU9Yqlo9nP87AfrkKgupw==@protonmail.internalid>
 <CADA=zOPWzK7Rq+CwY0izzjYdXGvTGKdSZMk2OUgN6_7oYV2xng@mail.gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <CADA=zOPWzK7Rq+CwY0izzjYdXGvTGKdSZMk2OUgN6_7oYV2xng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/11/2026 16:32, Hikmah Gumelar wrote:
> For the gcc-msm8953 change, I will drop the board-specific reference and
> update the commit message to explain the basis for using P_GPLL0 with a
> divider of 8 (including comparison with similar Qualcomm GCC drivers like
> gcc-msm8939.c and verification on MSM8953 hardware).
> 
> I'll re-spin with these adjustments.

Your best data-source is either published documentation or the 
downstream sources.

I assume one of those is where we get this change from so, basically 
that's what needs to be shown as the basis of your proposed change.

---
bod
