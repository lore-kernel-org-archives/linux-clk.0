Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9055E369972;
	Wed, 12 Aug 2026 02:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786502979; cv=none; b=SDv+8d/7Fhuj9p6GIfSXn1j9wyNuKFxEJ0FUnLXXDrktVlxpqBhKRpPdZYHvlRHu6PzEvG4yxSYeuURFngHniU4PLmMF0zp0iy5N3P2FaN2TBZWjj+N/1vmZhmQwsE3YmcAzBzITNSzw4pmMx/PUz5jwzknaF0emhjTDeTpv73w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786502979; c=relaxed/simple;
	bh=daeKRT964P98JkR/AORboeu12VB44V9Vdz2ahgEyyDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOnCBHqfukoB7lrII+pxiBtJQIYSuzv8Dot1ZrGvZFecCspeTCLvIak1dk39e7b+212BRuhmO5q3TwUZL4tPbbxYTvDI8c9aYxw+Nu/n3wOFhuuxSh3CvTAyZmZoCqEU6xSDunhMsLcgMyfbTK/tMOs9Iz+pGSlJE84GDsgkmGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axHzcEsO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axHzcEsO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB281F000E9;
	Wed, 12 Aug 2026 02:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786502978;
	bh=+bThKGwDN/bKFkN4VURpru942yPa+WAm018gK2eh9Ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=axHzcEsOOkHO/Z1WC2axZoatJKoklKIMjmiRBXSWvLtmXmXqz24NwUjYQ5elfNMHq
	 Qb5iLB7aQ0QK06/uSdCmNygdHKPCgwQbHKxEpjBOtyhOW4GZPTxmwosMC3lqjQoAm9
	 Mwuu/MbdBcwi1PnENjTT4DNO0DkG841EEdL6eWCTIkp9J8nh+yAJrHMTWmX+slO3Yu
	 /R2J7UPtw4wwJCIP+nrfom3CJjlXzV8qU6Og6LO16GZdVcSpsJf+wBn5fzNmAV+8RJ
	 uWCf4IVunmeOvIMEdDXDPrdZ+yLbsJC65pgsz0E2MfzypZBrZDUriSrcUAOJkyNmTN
	 SYdocZStHP57Q==
Date: Tue, 11 Aug 2026 21:49:37 -0500
From: Rob Herring <robh@kernel.org>
To: evon.chiam@altera.com
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Ng Tze Yee <tzeyee.ng@altera.com>,
	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Brian Masney <bmasney@redhat.com>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: altera: fix Agilex72 compatible
 vendor prefix
Message-ID: <20260812024937.GA616612-robh@kernel.org>
References: <cover.1786006669.git.evon.chiam@altera.com>
 <b467b990e5290a2eccaedff826968a50fb51100a.1786006669.git.evon.chiam@altera.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b467b990e5290a2eccaedff826968a50fb51100a.1786006669.git.evon.chiam@altera.com>

On Thu, Aug 06, 2026 at 05:25:01PM +0800, evon.chiam@altera.com wrote:
> From: "Chiam, Evon" <evon.chiam@altera.com>
> 
> Altera has separated from Intel. Update the Agilex72 SoC and board
> compatible strings to use the Altera vendor prefix instead of intel.

Sorry, without better reasoning, you are stuck with them as sashiko 
pointed out.

> 
> Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
> ---
>  Documentation/devicetree/bindings/arm/altera.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
> index 3030cf46fe74..2ab53cade2fe 100644
> --- a/Documentation/devicetree/bindings/arm/altera.yaml
> +++ b/Documentation/devicetree/bindings/arm/altera.yaml
> @@ -119,8 +119,8 @@ properties:
>        - description: Agilex72 boards
>          items:
>            - enum:
> -              - intel,socfpga-agilex72-socdk
> -          - const: intel,socfpga-agilex72
> +              - altr,socfpga-agilex72-socdk
> +          - const: altr,socfpga-agilex72
>  
>        - description: Agilex7m boards
>          items:
> -- 
> 2.43.7
> 
