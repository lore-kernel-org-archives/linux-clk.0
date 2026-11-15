Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752933;
	b=ZtQf2WH2FUrhBLRdPDKgDJCsSNmxdALHnUV8tEVWTtj1s9Qr3Zik+A6VDg3kH+DEqosd
	 DtZHmGElsFjObybnsoAK5tj8nqy71APcrmQcpBxR4uaGHB7+Afm91kXE2dfaiRAjrlD7e
	 uDucoTG+zgbcidzsHjBpXXHBWTmS3QV0xXGgOwyLQjCv2IXqLw2RIPdLwxrDdsevt7p4X
	 x703J7H5JHWgBDCI/5Gei5/UPzu6Ve2R/Ig7jNYsuaohNJuahZIJV5+AuGpPuNlNwVdU6
	 xsE+EDAPxWSYDGwfw4cR3MOaqzZlC9gLakrgVZK7jq6+78x+ac27K9f893WvyLPlo1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752933;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=qd7T0XQeMuB4TEUS/4gTtVnEGv53KlVhW/3K24NUHPs=;
	b=VJ+2046cYLiADOVt2gZz2HXrE0l7ClO2JbLFQtGMkSYtQWv0nk2Nb3uJGuzWbn+4Ah/n
	 wPalSCAAlnCsn5TxZs1FTYZ4z13LsFgBwa5k5ok4xQ0b9vfl3yFPnIFjbDcZj45fPN8aL
	 5YslfYBAUeyb3ON0Q5uFe86IOH6U+btXit9LSPSNcUN12HiIUoh1lHgwYSCXQi4qjrAwG
	 53WQ6Jlg2SreKR6Yozx6Oj6XfwfBrlXHK8P5GKrRSpcl2aocnS719vMl5cKvzzHTfPUEF
	 u28R0Hn/arbrwfdoh0gDeSagQXzhjAYK5M0yUcbw+yMRILUSOJ//uJaDfQyHyD9eP5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SA9ROFUh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83628606A31D;
	Sun, 15 Nov 2026 14:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SA9ROFUh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3681F000C4;
	Sun, 15 Nov 2026 14:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794752933;
	bh=qd7T0XQeMuB4TEUS/4gTtVnEGv53KlVhW/3K24NUHPs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SA9ROFUhfxPEAFREHKzDoyWDaBYsQ4kUcYlJx2NGd/sMgXCMtfpojGTHsNC4i999z
	 d4I3L4lryfiZXUzgec6OxBQRTBrBlHbt93uC6i1TCNWKE1SMUMP3Fwg41U+pOp5F3k
	 a32CduoNmbTSFmOj/4j7NJwLGemJHpQ6YtXDz2z6ACh3qMuMFVKpj2Ex9IHRZNxzMO
	 Er3r7f0kqD96nXQHn5jTUBCLbsoaLNl5quiB4uRtMMsTEvqMRziX4fpc5hcOxlInj1
	 vM6zAPWz5G36jNtUz9TS6pvggryMDlpwy9XQndt7Hm/U2BB2xsUQu0Mq/fYzTkemhJ
	 hz4jb7Z2cVbUQ==
Message-ID: <b485a0cc-91ed-44bc-80bb-fb61d10feccb@kernel.org>
Date: Sun, 15 Nov 2026 16:28:48 +0200
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
Subject: Re: [PATCH v4 06/16] clk: at91: Add peripheral clock id for OTPC
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Mihai Sain <mihai.sain@microchip.com>,
 Durai Manickam KR <durai.manickamkr@microchip.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-7-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20261105110715.2486432-7-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/26 13:06, Alexander Dahl wrote:
> Add the peripheral clock IDs for OTPC.
> This clock is required for proper OTPC operation.

Next time, please wrap it at 75 chars according to the submitting patches 
requirements [1].

[1] https://docs.kernel.org/process/submitting-patches.html

> 
> Signed-off-by: Alexander Dahl<ada@thorsis.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@kernel.org>
