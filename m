Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA6FB663;
	Mon,  3 Mar 2025 08:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740989780; cv=none; b=FfEEXFbMitiLH756588elVxN1rtNHwI0KxWkDqo55VPc4cdfQyDoh68NCUXkFq4ZAPtd1JhHC5RuqFnVU6tnQmoHe02+GAgdAkEFSyokvCBmZJoLJTGHkyXI1FVWl+3SEkBhWlPUj+UlF9DQc55jxcrvkyutmSKTJfFXOXM6H0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740989780; c=relaxed/simple;
	bh=WpVENpT1YK2sYuwp7T2nfcnGdJzUUfYWQCoT4uvyNbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=le9mr9dfOmGkOPP3NHiaPsPYXjdOcxVa9pK8gEVki7bVgigqoHKFju2O1aWCqcVde4abaKTQXGv4EaI1Jb5K96fytxF/Xodx+K5k+C2u+HzobVDg3wNQ2F1+xsrP1abFargemJ9YooPdAIoaPOxlOgfPwXyNvN/aXUZQ2BJtuy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RNg2ej3I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RNg2ej3I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02CF0C4CED6;
	Mon,  3 Mar 2025 08:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1740989779;
	bh=WpVENpT1YK2sYuwp7T2nfcnGdJzUUfYWQCoT4uvyNbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RNg2ej3Ir/igP8ssmmqQhKkiILbGRPlHLbys2+IrXcEETdyr+2FET//PxUQa2At2g
	 SH245WlKjfR/SS8qZvIQ7rsXDNctvpolgwmEoTAELZfbhAEPlLm5jG/WmGh7E9wZie
	 9EkMdy3oTWs005zLUwxpknUpppYfgbjhcRjj1UeY=
Date: Mon, 3 Mar 2025 09:15:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Peng Fan <peng.fan@nxp.com>, Abel Vesa <abelvesa@kernel.org>,
	cve@kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev
Subject: Re: CVE-2024-50181: clk: imx: Remove CLK_SET_PARENT_GATE for DRAM
 mux for i.MX7D
Message-ID: <2025030357-eagle-exceeding-a737@gregkh>
References: <5a5a21d119da57ad16d6971951e532b30465bf1c.camel@decadent.org.uk>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a5a21d119da57ad16d6971951e532b30465bf1c.camel@decadent.org.uk>

On Sun, Mar 02, 2025 at 06:55:52PM +0100, Ben Hutchings wrote:
> Hi all,
> 
> CVE-2024-50181 is supposed to be fixed by commit a54c441b46a0 "clk: imx:
> Remove CLK_SET_PARENT_GATE for DRAM mux for i.MX7D" but I think this
> assignment should be rejected.
> 
> Based on
> <https://lore.kernel.org/all/DU0PR04MB9417404E8E89CB82386146B6881E2@DU0PR04MB9417.eurprd04.prod.outlook.com/>
> it doesn't seem like there was a real issue to be fixed in the upstream
> kernel.

Now rejected, thanks.

greg k-h
