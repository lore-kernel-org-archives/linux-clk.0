Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793185897;
	b=nne7aarcnzoX619m1MNBftgWoalP1FB2DQ4f1orkpNiCRKK5UD8xijxUIZgLPhgthuBD
	 lsz5KNlEHkeQHviGbTNewZSGfZLqB/0EKJpXCQRb9xpnen791bzudnc8Md7pZIcYyQzSI
	 aRgVFDfeFpfDWqMiuRfCeG+DDadmj56vmbiM0yT8MQgDBW1vhARS6NRHx8k3m7sloFsI/
	 h+j/D6C4xhXhJ+jcCGh/U6VJOxctnMlsoUgHBwWlKvu12ybfJYTrkt/Z8HKLG7mUEpa9q
	 0HV+Jt0LLKN5Jebc1HmxSoBS7UOVuFJ7vrPTPE+Ty/oLO3VBRCwj2weOpEp19hy4SnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185897;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uq5lzP5HZBhxN05MgltXi4BcrQvn7uDqK9Zfht7hVnI=;
	b=fFAmrNUx3iVJittznxHyeCq9UjDkjEENATfNfL6SkeatBXejFz02lGjEr00XXXhjpE1x
	 xOObjlLtW6b2MdZiUv4us3Y8cEIWDfJuSNTj8IRlB/UgPhtnTh9Kj6DoWhwlyiQcbZHym
	 KLThELNit+E48V2/UFglLz4tKSYVx55h1Dgo8tAL4SFw0Ca3ag/4fM/Irz2dpH22ULfPw
	 CliepxlkbAPcyreapg1pPYYBAU+4zCXwJN8x3XM21ndaq3y/6Y1dcrY3OhXIIoHTOPuj4
	 MI95CwNeXEgxaE4gHSfxMmIC1boLIt3grf/ggT6kghZMgTJNJRoIw3ZZ0BagHIJePFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dhPcRRlA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4C8606A31A;
	Wed, 28 Oct 2026 11:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dhPcRRlA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A3A1F01825;
	Wed, 28 Oct 2026 11:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793185897;
	bh=uq5lzP5HZBhxN05MgltXi4BcrQvn7uDqK9Zfht7hVnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dhPcRRlAEZDOuxjdJC9G4OgAmbMjsTSWKhE2lxAgkhTHP/utd6bWtXqx9ruz0DVSG
	 lHBO8WwF8/d0RVNtw7WrJAZ3M8JpgND/c5FFp5dPuyCkD854t0YiTvvlz2cmmIgOEP
	 AMduGVQUZ1qYhAd4pAL0LhxM/0VE5ELIqkFuzwuwyWQyIGfrMRfbhXuQW2B0MPbJBf
	 ZzKAwhW420d8W+BkzamTvCTefDmpUbFNDW9IMF9gycjfMKESytFxk4QfTItGDcZW+y
	 8tueUBiEz5A+E3pDydjzT5b3Ig7xgUeoM50GhzrnjN8P45Ic7DFSUEPnidOYHXgIt3
	 3GXy+s/CVqwgw==
Date: Wed, 28 Oct 2026 12:11:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	michael@amarulasolutions.com, Brian Masney <bmasney+clk@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: ti: dpll: deprecate the
 ti,ssc-* properties
Message-ID: <20261028-shrewd-indefinable-tarsier-ebcaa6@quoll>
References: <20261028074436.1958132-1-dario.binacchi@amarulasolutions.com>
 <20261028074436.1958132-2-dario.binacchi@amarulasolutions.com>
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
In-Reply-To: <20261028074436.1958132-2-dario.binacchi@amarulasolutions.com>

On Wed, Oct 28, 2026 at 08:44:07AM +0100, Dario Binacchi wrote:
> The common clock binding provides assigned-clock-sscs to configure
> spread spectrum clocking (SSC), supported by the clock core since commit
> a7f16660af39 ("clk: conf: Support assigned-clock-sscs"). Deprecate the
> vendor specific ti,ssc-deltam, ti,ssc-modfreq-hz and ti,ssc-downspread
> properties in favor of it, so that new DTs use a single way to describe
> the same thing.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

