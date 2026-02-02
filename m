Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADD81DA628;
	Mon,  2 Feb 2026 14:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770040852; cv=none; b=IntMSfvoOZWDcW6ZuWFEfEKfB9vj8ZOoMclu++sSSXlGqzhSvxx58wFa1MtUZ3FjphamhGY+IBy5Y21JwEFjKM2ET+rjuvzfRVPxVjh9IUvr7adytT0eOkvUXAfdM3rIAWtyABGuKXeovVEnoqpld5r1L8u11hP9Tga09S1L/L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770040852; c=relaxed/simple;
	bh=SSe1U3RyX44yOGeamwF5Z72xDH4ii6e/bEK01Gi9R/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Or6g3Jm5KScXrctmr3y55iFMi4pkMmrfFcxBluEGbIheygW9rRXopWE3c6ZH44jydbfPdHeYl21Vpx8ootkf8hm8f//K08Jmz2PiE9O2PWKvwKUZv5o8/SO3UBoFhlTsA8kZ6Ry+44r2bx/xS9knsQZx5CXYtkgy2zlDEXctzKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=VFo0HZgG; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="VFo0HZgG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9q22FsWlE6guDtJm/Wf/hE0WHjYN8IUDMo1cDdPQiBw=; b=VFo0HZgG6NrGOfClCLnLJMWlZK
	X20yLz70VNTgN0AZwZyZK4FqFXNaJiIl+jHgd4h6xMgHG+9kiRzpXfTDi4tn1Va6PjJ8+3jwnizru
	Cg3wpHnBAfctRxqb/kTi+0mztbL/+l2gGv89w8T0q1tqEp6V28E6LIMrNQhKLvfB7ifM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vmuTs-005pdx-8E; Mon, 02 Feb 2026 15:00:44 +0100
Date: Mon, 2 Feb 2026 15:00:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Mihai Sain <mihai.sain@microchip.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	varshini.rajendran@microchip.com, cristian.birsan@microchip.com,
	balamanikandan.gunasundar@microchip.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, ryan.wanner@microchip.com
Subject: Re: [PATCH 5/5] ARM: dts: microchip: sam9x7: Update the tsu_clk to
 use the generic clock with ID 24
Message-ID: <7b4d2c8c-aab6-4009-9caa-04268439f597@lunn.ch>
References: <20260202104025.3781-1-mihai.sain@microchip.com>
 <20260202104025.3781-6-mihai.sain@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202104025.3781-6-mihai.sain@microchip.com>

On Mon, Feb 02, 2026 at 12:40:25PM +0200, Mihai Sain wrote:
> Update the tsu_clk to use the generic clock with ID 24 instead
> of ID 67.

The commit message should explain the "Why?" of a change, not the
what.

	Andrew
