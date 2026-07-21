Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88287378D78;
	Tue, 21 Jul 2026 13:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642092; cv=none; b=Z7MwgMZFAN+Dt8wZ3WCNkYEM/LgDVu1/Pp8lrcwiH/ZOzbcoYZDxkyx3MmgC0Q1qNMDZKI/RBOiEkb96yQ++HivckZdZHl+xeA8PXw7Njs9ORpTE0mFsivaJ7iXZms8AOoBvLb1zo+kUf0QzLX6rbKIeilHVTpNFELwQaIdKhYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642092; c=relaxed/simple;
	bh=bHKPaDC47pac+rbVsIo6MSrFwCc5fyJ185fG+Wzd5GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJ3zMj2dU1AqsRFGQhfaxv5uylFNMFSG0uFHlooHZXylr3seSAVYp+82/5O8kQNyqjF+N6Fr0PL79Q8mIvhsyOPXHIwMmCK0IJ2VjWydLu5Z9/qtx1iMMz67S75NXrwAVUKEWO1/KOVr2mFEbUW0tvfJZ5IRlaN8ypr34y99BmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IOag8JxI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IOag8JxI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A95E1F00A3F;
	Tue, 21 Jul 2026 13:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784642090;
	bh=07nBmD6iQARwb8F+J3AfS+gMadYHBuAG1quRgQMBa6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IOag8JxIa8qh6SktFrd6zN+vIbHusPJSSt5c33vpGxGXcxc3zN63XXHa6HW4/FWK1
	 5xVLLEmFHJgFEx2wBYToGgooVpVCt2EYK/VZtkJCtZeQqYgPI+kGtWwrkkeh4iz1YF
	 PoqSQmXrJyA6kf15AojQSbTn8HbbDPU3Bb4C2cBi7HlsmOs0o8mYYhaV/bmn/UXwT8
	 w10lwiSgmdAKnJSANnArIeat2WMz5NDqq/HmRcCgSYAAMI1v4x+nEXJVxwOgHquS4K
	 /WKVHf+NF/euC9PgLVjZwFSKGfpDYBQA8tf9BDPTYFqMEs2kVAXT+tQ5+qZAJTPkyK
	 wfommW2qffCOg==
Date: Tue, 21 Jul 2026 08:54:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: linux-kernel@vger.kernel.org, daniel.baluta@nxp.com,
	simona.toaca@nxp.com, Michael Turquette <mturquette@baylibre.com>,
	Brian Masney <bmasney@redhat.com>, goledhruva@gmail.com,
	devicetree@vger.kernel.org, m-chawdhry@ti.com,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert TI Palmas Clock to DT schema
Message-ID: <178464208934.3487880.1773756669829370514.robh@kernel.org>
References: <20260719141236.3563471-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719141236.3563471-1-egbostina@gmail.com>


On Sun, 19 Jul 2026 14:12:36 +0000, Eduard Bostina wrote:
> Convert the Texas Instruments Palmas 32KHz clock bindings
> to DT schema.
> 
> During the conversion, the node name in the example was updated
> from 'palmas_clk32k@0' to 'clock-controller'. The old example
> contained a unit address without a 'reg' property, which causes
> dtc compilation warnings.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
>  .../clock/clk-palmas-clk32kg-clocks.txt       | 35 ------------
>  .../bindings/clock/ti,palmas-clk32kg.yaml     | 56 +++++++++++++++++++
>  2 files changed, 56 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/clk-palmas-clk32kg-clocks.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/ti,palmas-clk32kg.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

