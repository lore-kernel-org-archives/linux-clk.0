Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793447833;
	b=Ls49PTNxLRXR/3qPEuT/MTO59GTLRCXwVDpGkXnz/EzAftc6mv6nXqLkx32qFnixRcgE
	 kaCdyTVmNNhBcLPvJrLbE5JzKMRAg8vuHm6ouM8DwIqZSjEzVgAsgikfbokF0RwgKxzNG
	 0priv8gH3n9tJ0EjXIEuUP9XFUmw7XBsEWLEZhiKFIKJ7w0mOqK6AHvXjoMJsDVMTAzOY
	 E7klg1hNjnz67J36CQ6zQCuUGP7/UCFX/k6Rguvu572Fx3RDh4ymkMoPehbJPhg6AJ9qM
	 ckX7iY9rimB2oH/KRHP/aFeEiVyjFaLgRhlFhYLsoKFWrtvoxyyadOB5JrO80DsOTCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793447833;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hbgrYjBJbZ044uSlWAyCxgtge92+lezD72P+VJK9EFI=;
	b=eMrfHsD4ycHo4/NjQuhguU3sf3ARho+LjdaGsyFwqn2kWbDhinnI5dNu8JwPB6KxLLXO
	 66eco+fehvuRHvucKnfXM00xFben3S99YwKuiJbSXx0EMIxJCrUzcjLfRcndfHNjXVPOL
	 uvLAj57OvYzKTqlSaej6LxCleMRFBQTiJXdYTwY1H0/rS+ymYaDAn9ht30/g1Q3g3DH4/
	 NlVCazf+eFux7kjeIaEJaU8Kjq8JJrXWHL6RD2vrx6TpO6gmswX4N/zd1g6n529SgyZqb
	 MOosEU/JollmLO0IjNUbnOsdbmlM8RoqmkkERGBwX9L0NBILLLEr1C+vB9YHqCvHPbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=xhLHmUdX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D58606A320;
	Sat, 31 Oct 2026 11:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=xhLHmUdX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E081F00A17;
	Sat, 31 Oct 2026 11:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793447832;
	bh=hbgrYjBJbZ044uSlWAyCxgtge92+lezD72P+VJK9EFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xhLHmUdXGLq1SN6VM+aob3ThDm+CIuxO+/EGNqPEpUxUV2He/iRFp7XDsFGiODBXp
	 9bQ1dcFeQOtFBvhBE5oe7RSODrPgGF3LBBGplcn+hlAkc5786sFz5Z1siGGfHJrngJ
	 VHhg3LCp4smjn1gEfm+19Z1OBHcwvOQ5ygSLSxow=
Date: Sat, 31 Oct 2026 12:36:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Sasha Levin <sashal@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Subject: Re: [PATCH] clk: renesas: r9a08g046: Propagate clk rate for ETH TX
 mux clocks
Message-ID: <2026103122-spry-laboring-8f31@gregkh>
References: <20260914165026.184612-1-biju.das.jz@bp.renesas.com>
 <TY3PR01MB113460768CDD4F8EA8D4928E486612@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113460768CDD4F8EA8D4928E486612@TY3PR01MB11346.jpnprd01.prod.outlook.com>

On Mon, Oct 26, 2026 at 10:22:38AM +0000, Biju Das wrote:
> 
> Hi Greg/Sasha,
> 
> Sorry, I missed adding Cc: <stable@vger.kernel.org> for the below Fixes commit
> 
> Commit e018c27e6052 "clk: renesas: r9a08g046: Propagate clk rate for ETH TX mux clocks"
> in Linux-next.
> 
> So, can it be backported to 7.3 and stable kernels?

Applied to 7.3.y now, thanks.

greg k-h
