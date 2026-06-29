Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B023C457D
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 22:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782772720; cv=none; b=pxAqJV5RBAncH5Sz4XeXb6w1+xjNB71tcQlCcXhBguASBgpyVFl5nIn+ERIBz/OcNm7Sz5aJKI73jDrzTcu/D6xCgBJqxHyRM1Ig+AwX5zD50LkDwA93ySLXelJYtRlcJJ2NfdBafHfKRgTcU304uoKO792wGkkH7N8GaO74OVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782772720; c=relaxed/simple;
	bh=+NUbzcIs3uDqg1pD7+u/W4d4nVKe81mM+x667bJFUZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/Jt6kAz6vr7TrrjhaQ+JSyt51XJr4bn9E3hCJ4uopa3jANDCtJ2otZzx1K68xhcmNfBevyIg5l5XGZ84g0RhJzt8cNuuwoYZ/juXLwW5xHonrMlLKLGjzjaub1BSXUnzS70AcDMTVrXQ2PTzcS5wyFdv1hR8aUdWy9JYLZRqtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HRpPXlw6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sXpNSLvW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HRpPXlw6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sXpNSLvW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782772717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IQtr76yzRE9B/LpOtdT6fX+zZ1ruw2p7m0cRkqGsLZU=;
	b=HRpPXlw66B5DlJytHT+O/0szmDJBE2gxgda3J2jdwawi7eBBg7sMCq1JoBJxb/Eu4G2pec
	rmgTm5czZCnu2RjSz0qAD9zfK1BKBMeuPzHbeCKJPMuOz903kiTmgWm7yGWyNYpfkQT3HG
	kohvZmrh+Edgbpt91XJUh9DAPVZYbXI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-wPD4_QufOg2hsxdKalpLyA-1; Mon, 29 Jun 2026 18:38:35 -0400
X-MC-Unique: wPD4_QufOg2hsxdKalpLyA-1
X-Mimecast-MFC-AGG-ID: wPD4_QufOg2hsxdKalpLyA_1782772715
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf25c2c8bso45222321cf.3
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 15:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782772715; x=1783377515; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IQtr76yzRE9B/LpOtdT6fX+zZ1ruw2p7m0cRkqGsLZU=;
        b=sXpNSLvW+/z0eGnwyygNOXzRqRr/hjkSkS87gwWZlvctJwZR2cPfxElizgRo2yMOSU
         pfi+hgiqG7FyBL/nvIXsAheJVeXIdbv3awbWg+GOi/SWaoCYMmuxjAiUKERN8tLkilMW
         bNbWtU7VsqrclNI1ke2UieF9tD/3pn9mfopfid+gF1yTMGUm6cxO6VLXWzmrLH/sJJcd
         7nHXcesqzegNM13BXkEwJ9JO5FnrMQLJjoPlfhSqXZ55HHcB4ixGE9E3YLgZQPcURQwi
         wqAbA4Oli+oyBEL4mnCUw9JKjLjKAE0QKxp19gR0Cl2SrCw4nKfpV6ZNOaZ6EwBgpddJ
         Lbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782772715; x=1783377515;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQtr76yzRE9B/LpOtdT6fX+zZ1ruw2p7m0cRkqGsLZU=;
        b=Go/lMFVsQLT66wifJar5OWGct6Q/LClawZH4XAibSMcdNSMdLbn7deCGdRlFj5SpVT
         pqeY4bhpmlKv6LaHx7k6jrRidx+g5MKo62tHyiGJ2vmd6Dpf9sSqZeyafWTNAwreevW9
         kqGS8Z7zhOBVHtwZVDxuNumAElp9nYoeGn5XIvzNcRT1zHKwpFGySeN0fpZvZo4irc8k
         dg7whYH3p535uGpMO67g12pv19FyMYheqVRv1lhKxKU25J4pzbl1Vfxy7oCkz1sa/slQ
         ro5CETZ2QpkTZGjE6fA9K2+PwR7pPBfhKJ+WUbflUtCOSZQCYX9plcTYunhC9QYWheiG
         Q+pw==
X-Gm-Message-State: AOJu0YytXdJHrNP6KuGj7I41RLWD/i9o7rhS/hIkAgHvEc4mGch7Onrk
	R8pFvmfjSNbT+xidlhKFxt/TVVaqNXYSF36Ncge90Q34E3dy2McWyfpNmRxCgTgs0YHrKPQYhSK
	hHpdmdQynww2PpyN5qQ+s0DX7Sgx8NHA4LHwzpoYT/VhNZoIeD/ccO2HDPFY6gA==
X-Gm-Gg: AfdE7cmBOSVP5eXREDzJEemHYlTgVCWmsKDX8DZRUZGJ+Se9spc4Gil2vHaw6VazaiW
	w4ExqabfH4u39FIOjBT/84WyifTmK0DH1cfglrT3MnG0K9LHHain+vcols3Y0y+xetisNXJU0so
	bOE4BsyBcfLPzOgn1e8/pA1oppMRF7HL79Rq5DjtqYp53sM1MfP2DqXUkBS7qIHUdWacYvIlo89
	WBiF4f9PhE8ff8pdSMIaHxbnBodpyEyh3cqksnP5jhYt4K38uDpLQ4UQbo21SsFdmAC0Ao6xmx3
	8lpJv76x0JC1W/IgkaDemGLKrIIk+EJoDfuIpk/VHcWlC/3jJ4W+MuDT3WsteKRMY++d2TLFlgb
	LoK2B7g==
X-Received: by 2002:ac8:690c:0:b0:51c:d52:6049 with SMTP id d75a77b69052e-51c1076da82mr18902551cf.28.1782772714892;
        Mon, 29 Jun 2026 15:38:34 -0700 (PDT)
X-Received: by 2002:ac8:690c:0:b0:51c:d52:6049 with SMTP id d75a77b69052e-51c1076da82mr18902241cf.28.1782772714458;
        Mon, 29 Jun 2026 15:38:34 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c10a265efsm5600731cf.27.2026.06.29.15.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 15:38:33 -0700 (PDT)
Date: Mon, 29 Jun 2026 18:38:32 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] clk: various improvements and fixes
Message-ID: <akLz6H3ZoN2cCYQN@redhat.com>
References: <akLzCVzbMbUsgDda@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <akLzCVzbMbUsgDda@redhat.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Mon, Jun 29, 2026 at 06:34:49PM -0400, Brian Masney wrote:
> Hi Stephen,
> 
> Here's various improvements and fixes that weren't picked up during the
> last merge window that I feel are ready. Let me know if you'd like me to
> drop anything and I can send you a v2. Details from the 19 contributors are
> below in the signed tag.

I forgot to mention that I didn't include Benoît's support for the Mobileye
EyeQ7H SoC since he already has a separate pull ready:

https://lore.kernel.org/linux-clk/h_BA0KRKTGSANQ5Y4eqo6A@bootlin.com/

Brian

