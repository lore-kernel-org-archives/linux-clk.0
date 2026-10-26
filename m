Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008854;
	b=fLnohDA5a/e+DuNk3gFwgS0jFAhDVr3fhYDflEm+83hxncUugfqJlI728XPY5Qi7kY4W
	 dZ995TOXweoq871xwHaO/loM3qLUXbOSRa1PewZriDoxKMrdWoNO+UVikW8KyQwcHcxrL
	 C8xpIy8JIEa5qP0XlXE6Eq/VQ/LDyCweFs0xamlvf59kvfbXxi1a5E5HVPcpNf0PdEpRi
	 CBkZ7SFVFQUzop850fQY+qeNgTZqqAy9xxlA8+kyJtP6j1Zdx9Z/3dJExl6g7PAFh9CYj
	 /TYCKrlJIcN+2vGr9pv35GuxCZoDyImIHmX4lEsDV1fcWSoIWBwfmbaJ4OkiQ3urrsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008854;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XQK2A6aT5V7OwSjqXtS7nuHHrJPakKeFPqrobIkbwms=;
	b=kNb12DhTo8Y0R9adxWOPexXpJf0mxjxqyZyommCIjXuId5hqyM07JjChw22MPud4ii1G
	 eqfh4abq5rNh0YIviadc6XiU8IWnVZ3bAL2gaJsZTGUYX86rYh+iuqAjOscg+D7V6EGeh
	 wehxrpqnkHqkIEtucp0zXi0NXDObE78KWQn+8ddwvb4/KpAHpetNZyyOEXQ13kyVtkqOt
	 +Q4kh+JztXj6hDjfzGAqJXHPVGOrVF3DTQw2gh2C3BJlVwHn10DOlmlo2qR9lNsb62U+3
	 dpF0wdd4mcDCRfXFCVbwfmYMBYP+r6offfdw0RT8gJjyGUBzd+CYUrMDH7G9v+t3rPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="X/2zkzHB";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40718606A326;
	Mon, 26 Oct 2026 10:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X/2zkzHB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294871F01825;
	Mon, 26 Oct 2026 10:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793008853;
	bh=XQK2A6aT5V7OwSjqXtS7nuHHrJPakKeFPqrobIkbwms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X/2zkzHBUQI/0TXX9TdsjhlB0uldFHCuDTpPpy3/ZDSRIwJgmMdqrVk0CFsQrsxV7
	 cuQMLZKdclmHvOeIXcFCX176q/SDoGh8oqh7WrXo5yeD4OA/tXn4/C2dY6N7Ta2Vdo
	 II5yW5Wt3xexM3fA1w9KUS+mtPdTL1FGiaOFxXvY1F9BH6qWKP/OoE86cW8BdkNwP9
	 xhdOOPmD7eyfvKD2vm4TlhxsuYq7WEJDg9hKSLtGtAydXseXle/71uI6BuLZNdBJ4y
	 5kQj8cEVO9+/Qa56ERfbqQZFr/5aPoa6cVWcuFZYs0tebApKbM1fOiA4FiB+J3hQFQ
	 yGwuvcO2txfgQ==
Date: Mon, 26 Oct 2026 11:00:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	michael@amarulasolutions.com, Brian Masney <bmasney+clk@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: ti: dpll: drop the ti,ssc-*
 properties
Message-ID: <20261026-laughing-chubby-lionfish-eaf8c6@quoll>
References: <20261023145555.3578469-1-dario.binacchi@amarulasolutions.com>
 <20261023145555.3578469-2-dario.binacchi@amarulasolutions.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023145555.3578469-2-dario.binacchi@amarulasolutions.com>

On Fri, Oct 23, 2026 at 04:55:30PM +0200, Dario Binacchi wrote:
> The common clock binding provides assigned-clock-sscs to configure
> spread spectrum clocking (SSC), supported by the clock core since commit
> a7f16660af39 ("clk: conf: Support assigned-clock-sscs"). Keeping the
> vendor specific ti,ssc-deltam, ti,ssc-modfreq-hz and ti,ssc-downspread
> properties would leave two ways to describe the same thing.
> 
> The properties have no in-tree users, so they can be dropped.

I see the user:
	git grep ti,ssc-deltam

Maybe you ordered patches incorrectly. Anyway, properties with in-tree
users must be documented, so make them deprecated instead.

Best regards,
Krzysztof

