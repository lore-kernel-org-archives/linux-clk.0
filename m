Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0BF18E1B;
	Sat, 11 Nov 2023 16:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="f4kmKCZ0";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PziD6oE5"
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74DD63A8D;
	Sat, 11 Nov 2023 08:18:21 -0800 (PST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4SSLTR735mz9sTd;
	Sat, 11 Nov 2023 17:18:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1699719500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jMq5So6xt6a6Nq+YORW/r80yd+qk43npInLTiEKTIN0=;
	b=f4kmKCZ0FdDrOEnGH71Rivf6MPHYWnyuKcJAne/nuWbcLaKO4sIBfcTzA1/8jeOCP5cnqs
	qGknLI/HQkw14H+7KppLWHf5PaecdGu28oU/trYbLZ3aMrxn/FoGfMQNqUiS3hXvUib035
	Hyolo912R6irvrQuDTjviH+ykl8KxiFtKE9qdGq+BJE6SyUYajOoAemyceCe/rljkKuyku
	DH2aa51aii8ZOumhV3iyWOrXOxDvIA0dxogvu3307mX7YoZZ7wd6JFcDhd/p1PW9DMLWrh
	ynnAt4wFdHNtm4k8k/WP+Eor9etrHk8CCbczAZot/RHInhbh3BwimA9x2Jxqnw==
Message-ID: <1a96018e-7601-4030-b861-6121277faa68@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1699719498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jMq5So6xt6a6Nq+YORW/r80yd+qk43npInLTiEKTIN0=;
	b=PziD6oE58nmaSNQPo0/2uJMMhTT+fHoLCp9uEjpKJ06pRjGR42zMWAGwj3o/UI4xq5a0in
	FPej5pWMg4XC5/+t0pWTQfrJeF4BgEC1NVhmsLcJNWM4rkKEfmVi46AXB8ilJP3z0g/CDZ
	QEbHzAWisqfzIYYDPllhKFG8e+YLuAPSYc7zp4jP6b4V8/3vu2859uGV4upzWKMwx6NS1r
	1iNpXcl5mdpt2SGalTlcQJ1cGXw1jy3LuJHlzz36gCj+b7mHeBv5HWZJCw6eInrrocP+8S
	wR8XYypLxu6zhRasPBfDhqsWoAvf/WM741D/m/IN6omR+m1ODewzIBLbIQwq6g==
Date: Sat, 11 Nov 2023 17:18:16 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/4] clk: rs9: Replace model check with bitshift from
 chip data
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring
 <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20231111160806.32954-1-marek.vasut+renesas@mailbox.org>
 <20231111160806.32954-3-marek.vasut+renesas@mailbox.org>
 <TYCPR01MB1126976075211411D9A3CDE4286ADA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <TYCPR01MB1126976075211411D9A3CDE4286ADA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: gwazh9tebjup1io9r1ag3hyfh67zbfj3
X-MBO-RS-ID: b28fb1d4e9504e2ed6e

On 11/11/23 17:14, Biju Das wrote:
> Hi Marek Vasut,
> 
>> Subject: [PATCH v2 3/4] clk: rs9: Replace model check with bitshift from
>> chip data
>>
>> Adjust rs9_calc_dif() to special-case the 9FGV0241 where DIFx bits start
>> at 1, encode this shift into chip data and drop the model check entirely.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Stephen Boyd <sboyd@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-clk@vger.kernel.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>> V2: New patch
> 
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Do you need enum rs9_model as it is unused after this patch??

Dropped in V3 , thanks.

Can you check the other patches too ? I'll send V3 tomorrow-ish.
