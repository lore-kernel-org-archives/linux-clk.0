Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0453F477984
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 14:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394767; cv=none; b=guhsYwBRj8oYMLlbkyoO0e3VPMFgF870p9KA9f2yK5DgpRPPbx7MyWUHQg7yUG7tdctf8Po21t5PWRr9INWJ542pOLSiiq88v5oIWtidyiy5uqjgLDBsLinKXOoiVNvEXgg4iLjrLjL8y80ip8PQWxyFOKyrhBThUVGG4Fxoy8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394767; c=relaxed/simple;
	bh=ntRH/yJFT8bnr3NA7fpl1u0UWwgPQd1nw1mxGnJ3x0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWkNhVDuZBQ5BTs07tHj82fLwDo8yuI6BTZS74z04bwIdTBqLRZg/HD44lU7VjVk6gs8RJxPD9yZOZkbyqbVSpWa+e0v/bPW+ro8f9r6X7cUZfdf6n0Cpijs4u3Cg298U3fR9PDrYYUCDsPy9KDOgp5XEPZINpbDBWjazqMnH+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S5LpRl7f; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MtaBCNzz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S5LpRl7f";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MtaBCNzz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789394761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/wHJSL8csboMYxIPrt9fIoOx8qVsPB687MZL7EWYIGI=;
	b=S5LpRl7f7638xXAMrD7Ef1/RnI/eoZwKcWqosBwe/7vmqOQZOKVbFTR58VFSgsw6q+GTLl
	QYEhRuw5fASUgutg/YETlluVJaD/AMfei2mQ6udNPNtH0/Vyh+Gbxng6n3O6kJeY4gs7KD
	B/7/i5C2POUAFa5gQVBHS1KUnG6agUc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-Nqvv-TjmOxCP3pePHYGpRw-1; Mon, 14 Sep 2026 10:05:59 -0400
X-MC-Unique: Nqvv-TjmOxCP3pePHYGpRw-1
X-Mimecast-MFC-AGG-ID: Nqvv-TjmOxCP3pePHYGpRw_1789394759
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a08ff8451so309593985a.2
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 07:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789394759; x=1789999559; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/wHJSL8csboMYxIPrt9fIoOx8qVsPB687MZL7EWYIGI=;
        b=MtaBCNzzHDfv7zjliJWoaABC/cavt453UxfGTtVV/kbd+wrQTSI3IBxIouNOJCzxCd
         sn7iwcCkvAe1qMIZA744alzJTikBlrsVbrsdyjlA9+QcTth7wF1FBtJyB2zQqfmLXIvU
         luv7t8zsShnl5UodcgLw2Xwr+o02A3rfK3R3SmrZ3snEr6fPH8f0j+p2B60OZNMBUYA5
         4BTks9CdpBGK/7Q/ScBmCwQtuW0bJDtSWRRPo2Sfl9ZKQnxENVusyUeA12nWf8H4mvoL
         n5Jp11ulCwTQsjNz9wINGuYhz2/6orkLwOMXHv3n9RFLYqkREWK5OsNjWzowl9Q2glzP
         bClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394759; x=1789999559;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/wHJSL8csboMYxIPrt9fIoOx8qVsPB687MZL7EWYIGI=;
        b=YvJ3TMGyhtRLKXldU2K/ZHI5YTWOdz2uURc5XFK8ztU/eT3hjcGUu3wt8LXZD4wJ7W
         SEZMwnMIpvjd1Te+kK44RvqsuAZgJflnAoyHm65ngZAYVjJn9dt3XXDY6oLAOqZhyDJE
         bhtNt29gT+3EoRFk2+hPjJLzuQUNwMFuKyK4Ppuq7y3kCljBXZL2jIoOg9TKAriU4Cz5
         cLdnrLIRI9zZckMYURtgzIMGmpVDZN8AUsdTbkZ5Cq3p3YBY7YO6JFHQa16+cUwYUFbe
         czszwuMrEDXfrdcJO47Kf6efMB/NxF1EQ3ZCZ9GcO08QW/uj+MWx++QCN4mNOu7mb0B4
         HatA==
X-Forwarded-Encrypted: i=1; AKwUvBwSaQAAUhVfHmnihdBZ7nDEKOkzLGmewYhOV94ODbXhKO4wLkHUka57Lnc98my8iDlBnAux/dHUOO8=@vger.kernel.org
X-Gm-Message-State: AFuF++mR3gk4xvbJ4m9TXOrAalhc7xhRbOqajmPuM+Rrujv3RFgS42+8
	LwVFdG6OsI0/6Ts89FCLhSnbPZimjBEEgktuaGxQy+hEYAbjs4Z14WJyEUe7ltQLXZuCUqNlDy3
	yB5f1vsXDaha17LWM17Yn5RzaWHgI6Wg3vXySbMpC0Ca822sb92iP3O1TlMKg0A==
X-Gm-Gg: AYBFou13XSu6d1Fl1D6siXety5FQ1r4SNlSi7mlIAUyWZXnBtGS0Xg2dL6yf+J6MHnF
	9EV4xQXq3p3z/xAd83YLyYsUPbD3WvT5I7bf4uDCapCqhOd/wEJ8LpkWVchMUMMJ/WmBe870wM8
	ZYIcwaa7qwlO9m+DaDaSDuOEohEUCV6QZ9hTDtPHyvvQs4gIFvuXi8kD8g15XbxgKCNXe4YY6gv
	hqt7bDXHIQUDmS04mju49XOoz5yKa1E4Obmj6x+L3F8KArbmKxouDO9NWNC564umXzsSCy+AhKF
	Bd/UtHkKW1BaK5xzKmtgRhNaIcA/5f9D+/WLecBN9CU6Iqd2nskaVi95mJB7x2sfKvnf1Ia5hKE
	6fiBJYSpGGasUTLUjNyL4y+cxPwoI7HYP5WE=
X-Received: by 2002:a05:620a:1a29:b0:939:6ec8:6928 with SMTP id af79cd13be357-93a2985d5c8mr389774085a.16.1789394757379;
        Mon, 14 Sep 2026 07:05:57 -0700 (PDT)
X-Received: by 2002:a05:620a:1a29:b0:939:6ec8:6928 with SMTP id af79cd13be357-93a2985d5c8mr389765885a.16.1789394756851;
        Mon, 14 Sep 2026 07:05:56 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ed67a93dsm906151985a.43.2026.09.14.07.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:05:55 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:05:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>
Subject: Re: [PATCH v4 00/24] MT8189: Add support for system and base clock
 controllers
Message-ID: <aqf_QZpOIj-170Am@redhat.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
 <amuWdRD-TBQtFT_4@redhat.com>
 <1f6bdf69-c3fe-4e1d-8ff8-0e36d9f4e063@collabora.com>
 <aqf6NH-xrMtCQppv@redhat.com>
 <f2bb7446-bfbd-4598-ba95-d9561a4e132b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2bb7446-bfbd-4598-ba95-d9561a4e132b@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Angelo,

On Mon, Sep 14, 2026 at 03:48:20PM +0200, AngeloGioacchino Del Regno wrote:
> On 9/14/26 15:44, Brian Masney wrote:
> > On Fri, Jul 31, 2026 at 12:04:49PM +0200, AngeloGioacchino Del Regno wrote:
> > > On 7/30/26 20:22, Brian Masney wrote:
> > > > Should there be a new MAINTAINERS entry added? There's currently 221
> > > > files under drivers/clk/mediatek/ and there's currently only one
> > > > mediatek maintainer entry:
> > > > 
> > > >       MEDIATEK MT6735 CLOCK & RESET DRIVERS.
> > > > 
> > > > Is there anyone from mediatek (or elsewhere) that could act as a clk
> > > > subsystem maintainer similar to what the other SoC vendors do? Help with
> > > > reviews, send in pulls, etc?
> > > > 
> > > 
> > > I may be able to step in, but I have to check if it's feasible, time-wise, on
> > > my side.
> > > 
> > > Though, that won't happen until mid-September... because, well, I'm about to go
> > > on holiday (in a few days from now).
> > 
> > I'm checking in to see if you would be willing to be clk submaintainer
> > for the MediaTek clk drivers?
> > 
> > Brian
> 
> Time is lacking

I can relate...

> , but I get that one hour from me is more than zero, which is
> a good thing.
> 
> Let's do it.

Thank you. Please send a patch for MAINTAINERS when you get a
chance.

Thanks,

Brian

