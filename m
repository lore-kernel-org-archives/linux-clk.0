Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B8E38425A
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 14:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782224132; cv=none; b=pij1lh/xrHj7QW7Kt+r1nI9+tyBR+b0EN3BLpXgfEO5TdUnyBrVthGwTHiNtJbyHJLFEzlrqQq0SEJYF5CDrnABta7JLtgzMCUx7OYNbjsoexRdg1cYCsEnJniltyaJLqEUTiTSrmeZhi0g1kV5JmSxv8yca0/8YTNSCetyxEQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782224132; c=relaxed/simple;
	bh=1CDyLYs9i+XbI4Sgve9hBq+4Pv0eYZPQlHzEOlzvrk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SA6SfbHFyFeSahF7MKFbBu1GnJLFHlvFsBvtJtjjjuhJ8P9uMFRAalY8S1ger9CDCLvx8Vnw7061NDcQeHTgoVfYIeJE0gz6dKhs4GGUSqCV2r/NQ03/XqdRNwCYad9tXeOwZpkEVxGh7SRiIEQawALS6B400OR2QO4QIwZa8hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iOyZYgXd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oGoVY6Fe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iOyZYgXd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oGoVY6Fe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782224130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GcRTCVkjYUUItg6iTxHwmqo3jGbyzUdvgEni0gISf78=;
	b=iOyZYgXdtXAjmBvOaEWJjD4W5j9rtbEGtgCp3QEdVRsYQrsKQFF/ahyD4IcosUznIpsvDR
	nziAHhKIbHz7i+mwW/Y6rygewmJrADJWKuFu8Ct+uJr55K9HGWhXy8ZXYdfn87d+HPhCqp
	B02gTzTLCotQRaR1WlWGVS24wyze2Dw=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-b6QOwTB4Pk6z8n9vFEFKdQ-1; Tue, 23 Jun 2026 10:15:27 -0400
X-MC-Unique: b6QOwTB4Pk6z8n9vFEFKdQ-1
X-Mimecast-MFC-AGG-ID: b6QOwTB4Pk6z8n9vFEFKdQ_1782224127
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8065f39540cso19720517b3.3
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 07:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782224127; x=1782828927; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcRTCVkjYUUItg6iTxHwmqo3jGbyzUdvgEni0gISf78=;
        b=oGoVY6FebBOdr4BYu4FPIM4pINiUgBs1gxdmB1P84qv+D62p+TLh6vEDycNGYoqUe4
         mtUEI9gPw94phQh+Kt4GKh+ucIg9FEZdPbII2vwtcp+XW0gFwC46HJjSJ0lrdn67tl0j
         8g57XfJ+awvOew2AEeY1D6F+RGXi5oKhhGfSCmIxnPpt8x3IH3pgKwXChGGSixf0MUhe
         FMHAj2nw2JOAfEr5BjE4x9KMgvQiurlkok71ZCd9Ah1iIydTGsvPB0T+V4eR8/JQ/n52
         HaP+CR5W3w7MW5ceWG+Ebl/pQ0rNnR7HprMCB3qXvMnfhir7nYo6mGC9Af1vkgv4J4Gz
         XoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782224127; x=1782828927;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GcRTCVkjYUUItg6iTxHwmqo3jGbyzUdvgEni0gISf78=;
        b=c+BTR1vrnyy1usPw7d607qYcyGU+JbzMiM4DbRAcdEUPXOaqt24QWN1fpQqbMZcyDk
         bpv+uiP3amiiXITnJro2Eoy2ZRmK3eOZo9IVptfCU5ybkxd081DkrxYUt5+zf6IhWMSN
         UhA2MWoMB0FpbRr9ZkDp6z9hgZRc2jniSPAo9jFqRyIFHHWz27+TLAkcmqpwaJ//K9jB
         GRXcZjThD41gyR6NeCcrlrQVmUq6iOvu4M2Se/IBJ5WK/dQ9izCa0yi5GcgV/kwuKPJU
         yR43tOdWH2k6W+QXckRUS8cMJIx5iDl/60SeQrA3y2inCVkOksmQtXsDbzJaCWfSL+2n
         wuiQ==
X-Forwarded-Encrypted: i=1; AHgh+RoLYBHybTebFxOO8RVgZJUJyLZsfMjqiTLtbndyCpHJcKO1Be8yjeHUdXmis1zF6pS0BCtZfWJYFWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBxgQ8KHI9klLL668bxdQo4FyaBugJc2jtA/DKOpooI+33WPxu
	pj/1yo2u+NTql6luW6D6we7teiRU5fGz+cMKqAc/AhVzTioDGisjinZbHkVbWq1MHcBqGeu6KLb
	VZoMOBJUrxR2hECO6nl8u+UHPVKRGwbsQzcDI6+v+QqO5xy9knktt+0ifuSD2AQ==
X-Gm-Gg: AfdE7cly9ektUntvCYUsWPm/w/r6kc/yakadYULy5nbxICj8NQupKuD6rCzAfSmQznp
	omqyBeYHouZkGE4EiSktfmK4WmerqJ/A1QW/+WB4fZ8jDZY+LyAhADthpCmEuf/weK8wv8BZKbg
	54kQtD8vXSdMUzBqF8bYUmAvMHDE8uAX+xOrz7/TgSwvmCRbGjxWo7G3ykNwqW13EVPGBKgae+g
	AjjGwQtSSJBGVTHOp5qX/1CMg4XmF+MtzOeQzMgCnkDg7v5gj4XnZ4Vte5ose6fUaF1v+CYPA7w
	8uZSdFQbyVt7MQmK4ShhLX+gu5mOMpth5RGBHt2SW1wqahg4jcLhVq+PrIub8ZqFole9pmpqEs+
	QSiKW72/VW27cT5l2tK0oA0TXEu9NM85UF5jjupYU5SjvLQ==
X-Received: by 2002:a05:690e:12cb:b0:662:a4ee:104b with SMTP id 956f58d0204a3-662ffe593c4mr17495473d50.48.1782224127215;
        Tue, 23 Jun 2026 07:15:27 -0700 (PDT)
X-Received: by 2002:a05:690e:12cb:b0:662:a4ee:104b with SMTP id 956f58d0204a3-662ffe593c4mr17495392d50.48.1782224126475;
        Tue, 23 Jun 2026 07:15:26 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df823ab84esm126185756d6.37.2026.06.23.07.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:15:25 -0700 (PDT)
Date: Tue, 23 Jun 2026 10:15:24 -0400
From: Brian Masney <bmasney@redhat.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Alex Helms <alexander.helms.jy@renesas.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH v2] clk: versaclock7: Fix APLL clock leak on probe failure
Message-ID: <ajqU_N4IXj2wnYQh@redhat.com>
References: <20260623094023.94231-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623094023.94231-1-mhun512@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Tue, Jun 23, 2026 at 06:40:18PM +0900, Myeonghun Pak wrote:
> vc7_probe() registers the APLL with clk_register_fixed_rate(), which is
> not devm-managed and must be explicitly unregistered on probe failure.
> 
> Most later errors already unwind through err_clk, but a failure from
> vc7_get_bank_clk() in the output registration loop returned directly.
> That skipped clk_unregister_fixed_rate() and leaked the APLL clock.
> 
> Route that error through the existing err_clk label so the fixed-rate
> clock is released consistently with the other probe failure paths.
> 
> This issue was identified during our ongoing static-analysis research while
> reviewing kernel code.
> 
> Fixes: 48c5e98fedd9 ("clk: Renesas versaclock7 ccf device driver")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

