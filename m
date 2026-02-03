Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099DB366802
	for <linux-clk@vger.kernel.org>; Tue,  3 Feb 2026 17:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770141299; cv=none; b=aIrT3XMzXA7zy6JTBxWre52adNKG0FEbnyWO5fjfDZuHQFfqLRBghFFLGb0i43Sprsm2eHy2wr/wroEKfkSNxdx7QAf3nLIJYD3EcOTj4lAbUuEdHpYRjfAxDFJ4vI3pIRvRDjCtewYaMB0rhMgZ/V5hhCHHS8mCUth8pJy0EzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770141299; c=relaxed/simple;
	bh=EbeudItOUlxxdZ+A3AiWDVtDb3JqRGR++QR9pByKdSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRGPPnY3BErQnPSQHBatEt7ur4fdNbXpJux9RwyPfp57HpJsLldkGVlREvOyltulw3md53+/m3M3r18SPcMxEJF5Z4ukWvN8MeffIQpLjL+m/clQ3+ss05kaPrHXZNkz4aCmcDP0JqhYqShtnCjmt0bk2QyFtz171gbdufyHXBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XNJj7tdU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rpw4/rGf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XNJj7tdU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rpw4/rGf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770141297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TH04C7HHcDm+vfuEaUs+pyru8FvGanMszlIgowU+sDs=;
	b=XNJj7tdUPyJZqq3rWY5ooEbbviHv91Ftg1VQ9UH/0T+9/HcZQwGgkKNzuE3F/kXe5kxZ98
	Y978ZUAmUy8U+35hH+SlJnAYUNSwZzd/RjB2vH/ySM3p+P+pfG1FV8TzUxc7MoRPLgCE+I
	rECcXwc/9VZLXM72ZBLPibcVhdD2bII=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-D35mhtvVPOamcXGZObYZ3g-1; Tue, 03 Feb 2026 12:54:55 -0500
X-MC-Unique: D35mhtvVPOamcXGZObYZ3g-1
X-Mimecast-MFC-AGG-ID: D35mhtvVPOamcXGZObYZ3g_1770141295
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50340e2b4dfso71804791cf.3
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 09:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770141295; x=1770746095; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TH04C7HHcDm+vfuEaUs+pyru8FvGanMszlIgowU+sDs=;
        b=Rpw4/rGfWKFIxHQSKGNkXo3hrZtrNuAk2KG8uGJhMRWnVuHxtAuVTQuQnZjKLnEWUP
         XkKo9nr9xGeW3hJwkIXjyeaNyDbO7Ymo8AnS9YOYLNC1eH81G8P/0YmsiBTsKDc1GxKX
         aWHl61/zsEWxwAx54Zc+oxocL/7nKKJ6vIXFkZ88FNAgIfGIusm1Cr4ESI35azCEDN1e
         2Zh9vNq2xG3rSrJsvw1k9v41KmuQmPVZUfQfPaG8zsHo9+hziJvjlEFsU86IY7P5AYjK
         EmXpKNMF5GLT7fF9rqveOUfEevZ0fDPZM6t/b27lmdsdgtYFi34zT45/U63CnE9q8oet
         lJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770141295; x=1770746095;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TH04C7HHcDm+vfuEaUs+pyru8FvGanMszlIgowU+sDs=;
        b=tprCZXZZdn2LgK0JtCvLbDyq534EbTfAw8Y1f2MOatxGnX13i0YHH0xH7Xu3FrBEK4
         kPGa5Czks/1loUKZ8i8Qv18sn0PRdigrdJfg8mbyZKLuTF0sC0wB0gFPLiTdGuhyNT7U
         KilT/Sg48eK+5x7OSXlWm6Cag5BtEIq0vf4xnXhZ1yS6s7dT38IMSxUrKb5+9BLngh/v
         QjmpO5VpEwfKwpbAD1kzLniHZwO0TCJsEQu2NPtKwsKl9X91GcbdZfNA90aGOoWxEirX
         LYH8BEcW300auQ56qJ9xCJSqutfgP9VXZ10felkX+6a6ohHmXO8EVeJernQXy1R9j5uG
         9cXw==
X-Forwarded-Encrypted: i=1; AJvYcCUrX8nJLD7ktx3qglBrnejIsNJtKzQZ/yCPD8NULmb6Fha9oE4d2FUCV1aGvqDAyWgPEbzUqqsOHcs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkjkK2JYbUNAeUEi9wYgFNE/V8ulckW6S4oD36sJxbcafPRtqf
	0dMOlgY0JYYX212KCAPg4KpcsjYoKdx5gNpWv95zxEfHD1gZPAX5gv+im12K3W6jEDjPzmMKKT8
	xQ2UVIjG5LskR+w/a/cgWHCntLtrl8S2M2b55q1QCp3kQ9BN9buuTGkc7SFfReg==
X-Gm-Gg: AZuq6aItexaTnh3Qa3P/FQseome6pjVRJEK+xss5MjoRSf2MAJgpjtY2URzN7zldbUO
	qjyhhYww6oFjtDh7KMIaFDlMok7nYAVZsirLy9E9JJBL+JrWfwEoxbNFS8TnEvy1TN+MIfSEW04
	J4dep8bN2UBdsHCVbpa/rwUCvhYXsu/PH94TvIEofgOQGY4RSrGLJuFHbORdkMhtt5787+J9l/v
	ut+tn9gqLRThS1bF4mHgqhj52A0Ot/ijz8bYaanddGtdqQQf2b7zHI0W8EYWKPIL4spA0r1eJna
	6Ue9Hxl/Umb6hX91/Q3Y3f0IHy1FNK2RDg3nPhhMqMUH+mPdd2YIEVgTWM9OKL88RGbQWZ4A9P+
	JA9bK/mtCnhYEFhdHYzIJPcmM1tExZP9s7UQ9d0i/ugkt
X-Received: by 2002:a05:622a:5ca:b0:4f0:22df:9afe with SMTP id d75a77b69052e-5061c18db52mr1685171cf.51.1770141295395;
        Tue, 03 Feb 2026 09:54:55 -0800 (PST)
X-Received: by 2002:a05:622a:5ca:b0:4f0:22df:9afe with SMTP id d75a77b69052e-5061c18db52mr1684941cf.51.1770141294980;
        Tue, 03 Feb 2026 09:54:54 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5061c1e7f63sm658131cf.18.2026.02.03.09.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 09:54:54 -0800 (PST)
Date: Tue, 3 Feb 2026 12:54:52 -0500
From: Brian Masney <bmasney@redhat.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] clk: microchip: fix typo in reference to a config option
Message-ID: <aYI2bKIfRfoFQr2e@redhat.com>
References: <20260203090101.348879-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203090101.348879-1-lukas.bulwahn@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Tue, Feb 03, 2026 at 10:01:01AM +0100, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 026d70dcfe5d ("clk: microchip: core: allow driver to be compiled
> with COMPILE_TEST") introduces a typo when referring to a config option in
> an ifdef directive.
> 
> Fix this typo.
> 
> Fixes: 026d70dcfe5d ("clk: microchip: core: allow driver to be compiled with COMPILE_TEST")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Ugh... thanks for catching that.

Reviewed-by: Brian Masney <bmasney@redhat.com>

