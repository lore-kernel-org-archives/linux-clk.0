Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1338D4EB48
	for <linux-clk@vger.kernel.org>; Fri, 24 Jan 2025 14:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737729766; cv=none; b=azIRK1i/NghhddpwyGl5VbXrRZfL7Sp6cjQVWYttnYWenjz6Fk4PJEQZu2HmHgIify426PuEyNhDbk+L49vt5RWgYkTp8R7MnnuF4YcQi49Ecwy50nKC8F0YA+DtcNzWwNk9UAuvu1UBEqywq1ibWNOWw7UrWxyuyrXVA6qZWZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737729766; c=relaxed/simple;
	bh=+heYfxFaXMWMl6DmoLqKKM0GoFAT4wvGdui/rnZq37w=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=Q2+FqwxvUmBSupbA4HtHA7VZc4eGrOsUiZkkQzYQnDVWWDPprwN5MTkpE+zJShagJOc53cc2PZ3yW//z8h5Yh2bp8MUxO3o3RLvI977g52LFzREFGNEG8BUp8NApSnrBYNIRfAcNMPtWkVjdbncorju7kJkVGyVBgEq0LnvFfgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jB94F4fb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jB94F4fb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4DD5C4CED2;
	Fri, 24 Jan 2025 14:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737729765;
	bh=+heYfxFaXMWMl6DmoLqKKM0GoFAT4wvGdui/rnZq37w=;
	h=Date:Subject:References:From:To:Cc:In-Reply-To:From;
	b=jB94F4fbPvFH3GZQYra3jbliafpIjHodBNf0yr1TcBWE5cPAUpV1p7hXP2yTgnQnE
	 wGqDJJB9j83WtYYKcxV82AzdN7Rp6TozBujFq0B0zXtXOVjltJ1HyoGIRVKrnVywJI
	 othNll7f6kOVDLq2RAHx0MFSGp6PWLVvxss5QQsYgox0X2nrs1w2XwBFPDAqs/EU2R
	 KNfp816IZ5uTsYWkyLXun6e3M83xwGNGW12lcys4dkUAbqFd/pQE1KBK76Fk6Nt7Jf
	 hAasbXkMCBb+ox6xtAQ0mjSOIn985Y2mwCEusdh2yX9DcCNu6jqonmzAmY0E0ENEgV
	 RFK7rVgCFWZFg==
Message-ID: <d385e871-f33f-4133-8347-3f108f8a6736@kernel.org>
Date: Fri, 24 Jan 2025 15:42:41 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Fwd: [devicetree-org/dt-schema] schemas: introduce
 assigned-clock-sscs (PR #154)
References: <devicetree-org/dt-schema/pull/154@github.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <devicetree-org/dt-schema/pull/154@github.com>
X-Forwarded-Message-Id: <devicetree-org/dt-schema/pull/154@github.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Stephen and Michael,

Just FYI, below is a foward of pull request for dtschema for bindings
adding spread spectrum to clocks. As Clock framework maintainers this
might be relevant to you.


-------- Forwarded Message --------
Subject: [devicetree-org/dt-schema] schemas: introduce
assigned-clock-sscs (PR #154)
Date: Fri, 24 Jan 2025 04:31:30 -0800
From: Peng Fan <notifications@github.com>
Reply-To: devicetree-org/dt-schema
<reply+ACPRLI5YLXX27TFZX2P7NVOFT5USFEVBNHHKO4ZXHM@reply.github.com>
To: devicetree-org/dt-schema <dt-schema@noreply.github.com>
CC: Subscribed <subscribed@noreply.github.com>

To support spread spectrum clock, introduce assigned-clock-sscs, it is
an uint32-matrix with format multiple elements of below
&lt;modfreq spreadpercentage modmethod&gt;, &lt;...&gt;
You can view, comment on, or merge this pull request online at:

  https://github.com/devicetree-org/dt-schema/pull/154

-- Commit Summary --

  * schemas: introduce assigned-clock-sscs

-- File Changes --

    M dtschema/fixups.py (1)
    M dtschema/meta-schemas/clocks.yaml (3)
    M dtschema/schemas/clock/clock.yaml (10)

-- Patch Links --

https://github.com/devicetree-org/dt-schema/pull/154.patch
https://github.com/devicetree-org/dt-schema/pull/154.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/devicetree-org/dt-schema/pull/154
You are receiving this because you are subscribed to this thread.

Message ID: &lt;devicetree-org/dt-schema/pull/154@github.com&gt;

