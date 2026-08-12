Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FD93E5585;
	Wed, 12 Aug 2026 11:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786534089; cv=none; b=iTexkQKthYAf7cvTMWYZAdEFwZO3GDgVtEcpGcA4bCgclyRrLWt48Oc9P0bd+zGI547d4fDvGHaO6y111KjkNS1+VeyOP/MZ2ecTvbx78BVffb3POTu/x3hnFxbFujtpXSuL5Gj+fx+Wq1BpZgzl4OhcwKk+WlmnXMhyuDN1rO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786534089; c=relaxed/simple;
	bh=BYQ3lZ/FJsJjd2Po0rni1CcuSyhTkem04oN9+BOSTKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9U4S9kWMmlW63tZ/FVEP91Umakifz+SB66hYQCJ/CnoW/Y961ildlnrsBdnV1kHrquh2oQtZYmQI79R7dicJONlEYwgXH7OMfoKZoZfxZD0OdK0RPVDLGduHE7gOO+Syc586aCqfV1AxVXeatDLxulkdK0GgwfCoHNlJlCM+W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YLftM2DU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YLftM2DU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B234E1F00A3D;
	Wed, 12 Aug 2026 11:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786534088;
	bh=6rj9VDAyNwxtlh4ur2Bp15Q7lZN3qVNAZuExRUxFGtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YLftM2DUJ93V7jsnI6hVOusafcAqpi+CzK/HQWi3Omrtb4QFXNemlMTdswm6BPKim
	 fygOm4TD5pm+vc4NqB7bEJYLTkUco9DSirt2rd/dPVrE2/Pe87zwcPeJ+N05tmM3wq
	 Kjo8IoErEhP/hqrhYK6a3AjWNgTImfmziOOCAFoqR+CqRHnEjJQIyyUkrdKVazo4cl
	 g9aSFnE97/IgS17y77beI8dPklY3uCcSl83KRzPJaD73cFlGGVUOM54FGC70TYTVt5
	 yYufZnQ4d3SPxShkbg5lT/cC9f+Q9UkGjaPJiXWeOP1AIpBEf2vyUpO48oItBaVx/q
	 NqduA9uYzaE5Q==
Date: Wed, 12 Aug 2026 13:27:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] Add USB3.1 support for Agilex5
Message-ID: <20260812-gay-dachshund-of-economy-ebbe56@quoll>
References: <cover.1786518803.git.adrian.ho.yin.ng@altera.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1786518803.git.adrian.ho.yin.ng@altera.com>

On Wed, Aug 12, 2026 at 03:32:53PM +0800, Adrian Ng Ho Yin wrote:
> ---
> 
> Adrian Ng Ho Yin (6):
>   dt-bindings: clock: agilex5: Add USB3.1 reference clock ID
>   clk: socfpga: agilex5: add usb3.1 reference clock
>   dt-bindings: usb: add Altera Agilex5 DWC3 controller
>   arm64: dts: intel: agilex5: add USB3.1 controller node
>   arm64: dts: intel: agilex5: remove usb0 in Agilex5 SoCDK
>   usb: dwc3: add Altera Agilex5 support to generic platform driver

Why is this patchset targetting THREE separate subsystems, including USB
which takes patchset as-is or not? Organize your patches correctly,
including maintainer preferences (explained on the mailing list and in
docs more than once).

Best regards,
Krzysztof

