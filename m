Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214201;
	b=r0AWlfaxS2eTfDKCFdyMBu0KfzeMGicbtRzSavyU92h9P7rfeVoOAVaYnbQpOpqq8cQg
	 381e2oHgm5GVlG1B5S1gK3McFZgF4+GRRaQpvdZKpaM2kDPBm+uj/SrYebRberuUGYnMY
	 DGk9mqbWEAG9+G/ztFaP3Lryfblr06RfeTCnigbMv1OGKbAthv4ISq07ViA8A2/xID+2r
	 GV3NoyncqotcAAuFoZ8FGgMaX22INMmxCxiAsKzpSUuXumr5zsQgOBxE02HHQOZuRyzM9
	 GTJYjZnECexWys9jAkPToo980hGVpEk8BkDK5GOP7eQfU1XFJr02DDVMv63y2nMIqZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1k1iPnwy0Bc6PGE6t+Zl0LM80Ml+GB/glVmXDTikwzo=;
	b=SX1rhTylaJTehZpK6JM/f8WGbELYUfqOAP+RsQ3VZ5U3O/64oK91kACIP3r1O5b9lf5O
	 2jlQ+C3/OoopWI66i1YAFtCtYwzUmAgy9o6iLdr5+XrLM0J6S/8IPfmcMIiYM0BqqLRjd
	 OpYXxXBx4AUnjq6nQBtqS39fgDg1WEVxCxoEe+L2ywbRlXV5H3zISLxTIJ7OgPGECmzZD
	 3EqEMOrhlAGX4POlX8L/Ie4962O7jYchvoxklnLKtCl3Xb8ih1UZcDSA2SV1a6dC4GUEZ
	 9n4/MQqP0fMccKL9op2hi+MIjCh08UiU2xqzC7uos7NMOMGh9OYeHiSzIjsi0hLFfFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OnOd9a+4;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F021B60A383E
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 08:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F021B60A383E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OnOd9a+4
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492f563d1c6so142684f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 00:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794214198; x=1794818998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1k1iPnwy0Bc6PGE6t+Zl0LM80Ml+GB/glVmXDTikwzo=;
        b=OnOd9a+40cUTIUJd/RPKN6pI46RX5PKhDsWihEr7CJdmnIghpvKcynZLfFAdlmQLUf
         CkKPJvCDmZ+K9I92oLjkIP6Qegn1s/vMzh6dzqs8Pf92kRp7Czy+deTkYb4CrUeq+Nmo
         xVgmWZUxKhklinLS64tasb/WZSjPVSiXXuiiwOfz+gGyAn9WAm62TiYODWcJQUnfTMcf
         6Pu3HRyq++/t2+otcKIe0MtZVq9fATorThVCebMdl2D+yvja7OHaOWHYeK2/f6B3IOz6
         JWCSOP69cmyql0lrJU3z4Va67GGcrql04GqBwHbtt+v01AzgxHGSjC5tP0hOKjw21+F9
         J9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214198; x=1794818998;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1k1iPnwy0Bc6PGE6t+Zl0LM80Ml+GB/glVmXDTikwzo=;
        b=Tee0+P/tSac/L4QzYcn4WJ9wDBxxGj28yshqNfWzodn4Atum5rL2hfaulYKbZK7kJ4
         o9IN7EEforceoFRzhFofIllAhbMDO/2NlcaRFJhoHqb+TzVnzmjWMR7gCqBBS4YH9J6J
         v8o93Zxp65o1afZ0Ziw9X3RRliG8GroQhU5vuiKua0pSL4zw+ooSbce2A3VpJ83OCwMO
         VmPNWj1DOnrLRhbbJuZA5Iyy0csJQiJUMEPay7picYdel1m/GeP1RZRkZodiT+zsT0r8
         EdeDgT/sHlRxvBAdCqmd2KAXCpJESQWJM2KaJRq+ryyUReLC9WgAbaARQX/xSEmQmG4S
         u6wg==
X-Forwarded-Encrypted: i=1; AL+hErHNDi/Kzg1CIAui3cJYGlVNVK1Mclx8/MfVjzW8IVboVbouGKhiJ9Fm+dBcDJJ6hu30wRsTSuX0YTg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sj2fFpIsiawGx7PadEcibI5+8S28sBEzePGQPRafr8np9Sdm+
	NLV2/PuaXQJ2xsMYsbJZtNz34C9Wfs2nEbIojGlcPHLMtlz2KLWK0p90HcLNxx3i1Hc=
X-Gm-Gg: AYBFou2s/DWsN7j2dYD1Ac8VYQNXvXWZ7CE6fOVSZ0TA6fh35n3GpIP126W5wj4lS8V
	80MAIw8T+iEAwucat1Wp6Un4Cx+Tr4mp2iBPg37d1ryHk9UxO5YxVqu2bNBE+Xs3nYqxTYmJcIE
	jEhmE8hz9Rz845LR+esNB/r/rKaOJhrW7iVwM1MCZQPuNNpEz96/6KTLr+mijdIh1QkKdn+cd4C
	5SLB4hweq095qbMbzc1J0aTN/iIAM6NL2bmCr9aNWwrRRqn2oKb2oKqzTHSZ8AKGGQvvud3zQav
	E8Cy/S3ZJJ1OGN/UtGgyBLKdDGvDWVSK6MVyMEKUr31gBALUSlDroxjrb7e681djLK+436Ss8/i
	UrsmvAHrsbGhspioovXE6Jdfo5OGionXM697M1QxzDlZJuZkn6cnW4otOvOp4D7MgEsl4C6BvNt
	oc6cKPf4z1ayU7Pg7qz3vjLMJ/gd3V4RnUwkG5qrl1I9fLWNGVd5TqmVVFZgVrPDfuWj8dql5zj
	2YZ68reP3P6Xml1xCbzp2TojOjVA0v6epvpQtOJ/AXLUhQEUjIgOFe6S98k2hNY4nNj5vtn2cHP
	iLsGjfbclP0DG9sEgnNrG0Efuy0WYCMp8QRIFjX5V0MT4olp3Fek5xGoMumJB1ijZlTXVhbXtgf
	XURR+MsXnat9v0Z5W1Qe3z6c04UlFASwSI1svM8DapUlt7w==
X-Received: by 2002:a05:6000:248a:b0:48c:4442:54e with SMTP id ffacd0b85a97d-49584b5afe0mr6225635f8f.30.1794214198288;
        Mon, 09 Nov 2026 00:49:58 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597090444sm9069465f8f.31.2026.11.09.00.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:49:57 -0800 (PST)
Date: Mon, 9 Nov 2026 09:49:56 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
Message-ID: <avGIMja1yTAkG2X8@macbook.homenet.telecomitalia.it>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
 <20261108-computer-backed-d98862794d18@spud>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108-computer-backed-d98862794d18@spud>

On Sun, Nov 08, 2026 at 23:21:08 +0100, Conor Dooley wrote:
> On Fri, Nov 06, 2026 at 09:30:24AM +0100, Carlo Caione wrote:
> > The S7 firmware exposes clocks through SCMI, including sources needed
> > by the other clock controllers.
> > 
> > Define their identifiers so devicetree can reference these
> > firmware-provided clocks.
> 
> Are SCMI clock IDs actually suitable for being bindings? Can't the IDs
> vary here between versions of the firmware?
> They're also not a "made up" set of indexes, like traditional clocks
> are, they're real numbers that come from some document akin to
> interrupts that we do not have bindings for and no driver is likely to
> reference these definitions either right?
> 
> Is something like this not more suitable for being included as a header
> in the amlogic dts directory?

Right, I'm not strogly opinonated on this, I followed the existing
Amlogic SCMI headers, but I agree the dts directory is a better fit.

In v2 I'll drop this patch and add the header to
arch/arm64/boot/dts/amlogic/ with the DT series instead. The examples
of the two bindings you just acked will no longer include it though.

Thanks,

--
Carlo Caione
