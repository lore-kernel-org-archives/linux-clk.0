Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B35E4E13EA;
	Thu, 15 Oct 2026 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792056381; cv=none; b=FCBXt41At/Bn9EEcOc5l2R0m6tuTuSJiB2+a2xa9//G9VwsUTLZED/VV3CWFxkZvkl+tyj9YHvFWa8sWNFeWVRcy1vtIgEdtTY1IzSSdPLewyTU+a+tJksniMXYjgXyKv1FIVTiQigTme0kgApPX46M39H6TrathbRR5MIvkffM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792056381; c=relaxed/simple;
	bh=RfRSjNCP9bNVVYaChRrf5R+9DvUfJoAPLNCoNHOO3LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ph2Ls8ocdG3VrVqfDozj0AXxgQ1IDpKSHkjAqlkYDhrCg/2B6kbYVlGOUJYhNnBEDsRIj8QPLe4LmsQRk/kj5TrCEQjOX4um7OMRjPpw6qI9rqE6qg2HQCNwHlB13LP0EwEefmpSjdE17gjDjwnd0UwVjlqxj+N4759Uyt8F51c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bMJrhViW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bMJrhViW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF651F000C5;
	Thu, 15 Oct 2026 09:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792056380;
	bh=tvSQ5JjVVzKgDISLgAbOdjr4gi+0+ZX6RQXa0ZWIkc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bMJrhViWLhZbJ+NvzguiAcc8VW3h/jigXnLyoUXisaUxD8i8IEegG8VbYRk8bAmvI
	 xPyo6c1+nk4lKVsF2hAUDb+PtdyqUN/Fnxy9WayhzbS0iJTW4PlfAP/9B0vNJhjKe/
	 AUyCwTRcjDtflS6Lt9P7LJMb4bv66/SMkJFpiYbFUvs811TWP+zogEVznPc/0xr7CO
	 SGzr7sOCisvQzAHmNV3/aA1RnVkpweULE4ebafV1Oqv4/zFIaDpZnje6GMYLJew/kS
	 jbJeqCze3H4tKXwv1POR1N63MB35FBhIXTUqC/5KdL2yk1rFoH/0uYy3NThNrwJ2FF
	 6XJEnIq3KlFmw==
Date: Thu, 15 Oct 2026 11:26:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, 
	stefandoesinger@gmail.com, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/24] dt-bindings: clock: Add ZTE ZX279128S CRM clock
 bindings
Message-ID: <20261015-stereotyped-jellyfish-of-honor-6cb5da@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-5-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014072109.1759502-5-ghahramani.navid@gmail.com>

On Wed, Oct 14, 2026 at 08:20:44AM +0100, Navid Ghahremani wrote:
> Add Device Tree binding schemas for the ZTE ZX279128S clock controllers:
> topcrm, lspcrpm, and crm2. Define fixed clock lists and simple-mfd
> for child nodes inside topcrm.
> 
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
> ---

Also:

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

Best regards,
Krzysztof

