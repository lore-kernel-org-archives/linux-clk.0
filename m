Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2497263B
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 09:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701335; cv=none; b=jvHVAKIQAFLhO/bUbx3VeuWUNx59BigDnUT6CmKQiyRqwIxzIZRSJ89tSdX8LJ5TjZYDo3ohIlSWYNbl/V0nYAc83SIadGpfFgevTtAqVU+iiPJ2mFLAHiMDfSufZ1X+ApFryZT6hirHfg1nFvyrRU3m+sOcdmYHOymoz3a6E9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701335; c=relaxed/simple;
	bh=tpyvsJ5mRstCIGOMN8iC11VlwxpnD/CAOM3DjfcP76Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCu+LRHEQLlBhHpw1nr/VMRM3Uq24cMU+6IQcCX6mEJe4tJuiVGrq/xxQd7NTKfJfyakF3KUKEMMX9qfaO3REjHJteGCtw4CTdsAnuVL++22nY/XDuLz8SN/1BsztehFCCfIUHCX+KruuTeonhEZzbQmmZysJEDJOBMriBP5w7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=fZPhLDO9; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="fZPhLDO9"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id B9B93240027
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 10:02:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1772701331; bh=oVZVukKQPGInYg9l8zQtE22dcUH/mSI7y5+pwOn1iv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=fZPhLDO94MOPDleagVYuVHcpNCCNxe0pBNlqV5OvgYMApL1C5hDArjh4dSSsQsz1P
	 9iQdyWHN3a9+ohz+xLCMvXQn9ISwGBAXWqi1hRIzGa21/NjP7rewC4nYrzpIvrOnqa
	 JRhPNklB6qPRtaDLrHmnNqySMzTkLFNiuLBtkzlXZ1Do0Rh8w5dJB/wc296lcT5Qyv
	 JifKzrChlmk9bodRuosrR+YXF+b6RS0OCcp7n9yhVl1FlxBgBRpBbrcdWT17KUzv5+
	 CD16p/2PNHNDa55kHhSY+G1qdvvb5FhiZTdeO13IZk4no/P+5w+mBI5eLu4pGlcwbX
	 s8+ADd5nAES5Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fRNp96s7pz6txb;
	Thu,  5 Mar 2026 10:02:09 +0100 (CET)
Date: Thu, 05 Mar 2026 09:02:11 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Brian Masney <bmasney@redhat.com>
Cc: j.ne@posteo.net, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Tao Lan <taolan@huawei.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: hisilicon: Improve deallocation in error path
Message-ID: <aalGkLuM1jK3Vlrw@probook>
References: <20260303-hisi-error-v2-1-7cd9b43d8fbb@posteo.net>
 <aahI_4lfMdQjZCu3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aahI_4lfMdQjZCu3@redhat.com>

On Wed, Mar 04, 2026 at 10:00:15AM -0500, Brian Masney wrote:
> On Tue, Mar 03, 2026 at 04:25:18PM +0100, J. Neuschäfer via B4 Relay wrote:
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> > 
> > Unmap 'base' if an error occurs after it has been mapped.
> > 
> > Reported-by: Tao Lan <taolan@huawei.com>
> > Closes: https://lore.kernel.org/lkml/ZNlSH+eWV8Sk3FYn@probook/
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> 
> My understanding is that you need to use your full first name in the
> Signed-off-by.

I have been contributing to the Linux kernel and other projects using my
abbreviated first name for over a year. It has been mostly well received.

> 
> > ---
> > Changes in v2:
> > - Rebase on v7.0-rc2
> > - Update my email address
> > - Reword the commit message somewhat
> > - Link to v1: https://lore.kernel.org/r/20240708-hisi-error-v1-1-727bc7399b63@gmx.net
> > ---
> >  drivers/clk/hisilicon/clk.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
> > index fae65127cd4aa8..08050ff1c8cf9a 100644
> > --- a/drivers/clk/hisilicon/clk.c
> > +++ b/drivers/clk/hisilicon/clk.c
> > @@ -70,7 +70,7 @@ struct hisi_clock_data *hisi_clk_init(struct device_node *np,
> >  
> >  	clk_data = kzalloc_obj(*clk_data);
> >  	if (!clk_data)
> > -		goto err;
> > +		goto err_base;
> >  
> >  	clk_data->base = base;
> >  	clk_table = kzalloc_objs(*clk_table, nr_clks);
> > @@ -83,6 +83,8 @@ struct hisi_clock_data *hisi_clk_init(struct device_node *np,
> >  	return clk_data;
> >  err_data:
> >  	kfree(clk_data);
> > +err_base:
> > +	iounmap(base);
> 
> Use devm_of_iomap() and it will be automatically cleaned up for you.

This would require a larger restructuring of the HiSilicon clock drivers
to pass a struct device * to hisi_clk_init. I'd rather avoid that
because I can't currently test these drivers and because the benefit is
questionable. However, I still had the upstreaming of this patch in my
backlog, and I think it's simple enough to review as is.

For instance, in drivers/clk/hisilicon/clk-hi3620.c:

static void __init hi3620_clk_init(struct device_node *np)
{
	struct hisi_clock_data *clk_data;

	clk_data = hisi_clk_init(np, HI3620_NR_CLKS);
	...
}
CLK_OF_DECLARE(hi3620_clk, "hisilicon,hi3620-clock", hi3620_clk_init);

Init functions registered with CLK_OF_DECLARE don't have access to a
struct device *.


Best regards,
J. Neuschäfer
