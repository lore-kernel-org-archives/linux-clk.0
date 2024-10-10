Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA9D7DA62;
	Thu, 10 Oct 2024 15:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728575209; cv=none; b=NH6QOB2utkCnSj9M7gc3RIFceYz7gG9WSVFqW3aNfwNeExYXsg7Ef5A2EloldV1XbWPZ8hACIfT1E5xJSppSzHzstrtG3KVgFuuVrH5CMblBrx89Ua9cIZBcp0wBG3lO4DO2gOMaPS1nwjC/JokyIDyJbai9tOZFPXxmVJmCMRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728575209; c=relaxed/simple;
	bh=BcklwIPLkpu4fxMwkXRDkGneKnsCV2g/ESM5RSTNm/M=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1a1LI1u02zR0v+5pnEnQ4CaqZjbyJmsjGzO1cKYURPOQUyvj+CONYZOVOHP0N81VTt2JLQF9qRM2h64veau1OezRWcJ/ZBpi6d8wa0zFUU+SH5q1Ra1W/8g4xUWvh9lfDX8NNJArSknyzP9sIkKlgz/NYA4OnLl+XDbdwqdNa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WR4rneAD; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WR4rneAD"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-537a399e06dso1231427e87.1;
        Thu, 10 Oct 2024 08:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728575205; x=1729180005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HVjZwI6hl2tyZM8ZvNXJ8tMXRypVCi7fijTenIxP7bQ=;
        b=WR4rneADqckowoEQoE8bGoMopgDfvTh80y0wabZ0tEG2t5LL3DnNhGk1gcrlpxNwfd
         A8dM4Gw+9KlMhmh1yp4IGiRPKdaMK+H/AaCRo4CU4ZaF3zB8BfVyRhG0z6r1Xxl53A+a
         p3mGjNi0nqv0uPGu3wX5vQFKSF9iBHsrFiA1GiGJpnJzkCrsq2mTETPis2I9yD/6kn23
         MGwIK1cVq9X9BNYPkiAF+eosq5vFtceX91Fop6mUoO6ispXZKcNITy3Jhvm+sTpkgbyF
         sN96CqkTtp4V3Vps0mzSj7IjL8JAFa8rlUL622TrutEVv68H0EC2Tf+UWZR12apkUbHv
         Wh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728575205; x=1729180005;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVjZwI6hl2tyZM8ZvNXJ8tMXRypVCi7fijTenIxP7bQ=;
        b=bDkUTVKGRmvIpGhpkJrMVSDC9pWIX9drqb8LOBrrW1ScTXQLhJLyciyOtel/UUvlIc
         8Z/GjWvTdi8ggnLWp2mfSIT4Y9bEuXzE6A9Nz4tGcK5uT4DSv5M7tOXoKevOLCYYQUrn
         lTY2rwDvHcskCQMkyOsSW4bM7Agq6qmQP5qBoeS4E84wJZHhXxOeLqqWBpqKpc6ppWBY
         qXV9ohIU3gsN7xur/pWQnKqYLKLokS6vgZ7cvZlF1lLWWgw/BQ1tiNgPHOGScfOPSekM
         U1mu7IBVmUvXl5vn6pe8/OEmae27Q0XD1WF1/sw1Yam+RyUgVkS+wAEBdsp2v3dQXHwD
         Sdgw==
X-Forwarded-Encrypted: i=1; AJvYcCUH9MBmc90+PhdyfVIrFgW7UT3cRhl5OcIc/NsJyP8nTZTBZOGp7cgr/ZTEmxbyv5+2oxcLv+uR9bsS@vger.kernel.org, AJvYcCXdsH3KBR1MQYKZVeVTqQxC0MTxgDeCp7dFG1CWMycbhyfakU404nUENXzFZZqc6a7ddf3OM2HH+5Le@vger.kernel.org
X-Gm-Message-State: AOJu0YximYrcu+UQZ/FM+/bnRNVZDaS174wUG2qK+8jkUZZcbqmBkHKd
	vsDrrd/oIFDBUbYARpSIKWFbDkNLTFmfE0TCPcdHdvcNKq/kOFWs
X-Google-Smtp-Source: AGHT+IGBWbU6HUavBl3qImO0Tpr12X4yslnT491e72vOq0sgsHsjujRSayzEAobHVY3rDoJdS1/GeA==
X-Received: by 2002:a05:6512:1247:b0:538:9eef:918d with SMTP id 2adb3069b0e04-539c488a532mr4300596e87.11.1728575205165;
        Thu, 10 Oct 2024 08:46:45 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182d790fsm19521105e9.6.2024.10.10.08.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 08:46:44 -0700 (PDT)
Message-ID: <6707f6e4.050a0220.97bc9.6760@mx.google.com>
X-Google-Original-Message-ID: <Zwf24dcr1SJq-7Ph@Ansuel-XPS.>
Date: Thu, 10 Oct 2024 17:46:41 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, upstream@airoha.com,
	linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com
Subject: Re: [PATCH v2 0/7] clk: en7523: Update register mapping for EN7581
References: <20240903-clk-en7581-syscon-v2-0-86fbe2fc15c3@kernel.org>
 <ZvuzQxjuN2zRrAMG@lore-desk>
 <e0c20d3cc4490776fd2498bfd72ab6ad.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0c20d3cc4490776fd2498bfd72ab6ad.sboyd@kernel.org>

On Wed, Oct 09, 2024 at 04:24:55PM -0700, Stephen Boyd wrote:
> Quoting Lorenzo Bianconi (2024-10-01 01:30:59)
> > On Sep 03, Lorenzo Bianconi wrote:
> > > Map all clock-controller memory region in a single block for EN7581 SoC.
> > > Introduce chip_scu regmap pointer since EN7581 SoC will access chip-scu
> > > memory area through a syscon node.
> > > REG_PCIE*_MEM and REG_PCIE*_MEM_MASK registers (PBUS_CSR) are not
> > > part of the scu block on the EN7581 SoC and they are used to select the
> > > PCIE ports on the PBUS, so configure them via in the PCIE host driver.
> > > This series does not introduce any backward incompatibility since the
> > > dts for EN7581 SoC is not upstream yet.
> > 
> > Hi,
> > 
> > any update on this series? Are we supposed to do something?
> > 
> 
> I was waiting for review from someone like AngeloGioacchino.

AngeloGioacchino any chance you can help with this? It's sad that these
simple changes stalled and are currently stopping upstream of the EN7581
SoC :(

-- 
	Ansuel
