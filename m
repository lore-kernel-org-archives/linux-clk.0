Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8263DA7E3
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 06:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785134377; cv=pass; b=VoKjsevWfH43SBsbZD2lEGVWvmfb5ZF5ikqRMhjo+wxK2+adt1PSGsZJ671X6njxerDCsBK5pP5ee/T+NO6OlfkWXNgE6Zzzk31tF9DCOjnDNq+Pk1pMpHb8rLlyfRnmrnsJVq2WPdC4Tv/MczMlyEAl4O1jLV3awmpZCGLSOv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785134377; c=relaxed/simple;
	bh=LsUei+I8aVDj4dV0HZrZbWcRHocIt2pFuCRFx/b8TcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vC72cOqXbJ8cz3/7K/PrRLOAmypmmfgASuDnV+fmhI2JjAluGkvVRYgg5VLqf3C5old4nJwUEk/nKELN7/UFD/droGi8lPfFehWHxdzNRJp7Zr6L18lMIqF+6m3TUMXbaKCJXmhgIIFGl+/E//iKkVPE8qCkyWt+cgnAkgzSkjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffcjKojY; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffcjKojY"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so2209280a91.0
        for <linux-clk@vger.kernel.org>; Sun, 26 Jul 2026 23:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785134375; cv=none;
        d=google.com; s=arc-20260327;
        b=RalzPKmh3lSx4ScG4KWNoZM2vgGMPtwOzgm4hdfNATGIOoKumfZOYi6U58FVHNFrmU
         Kh12G8O+PJ09R0TPsmy61ssqzuEnaIZgtycNWJ3QDt6KB7BH1yEWbwiawcI3ZqEPi2xN
         Dc/Qd+7oobGznHMc2cOboXVbNu5eYzSW4vmhF+oy1PQKpNQeBG//C5EAQbLD8B9FQXce
         HGR1gqzNMOn5IUgzzK8OdBoRs7XrN5vETMyVg5AUQuhuyIvdMyKBPQDcV0m0Lfc20pHM
         eU6PFZnz4cL7NP58F3HZpRLObtBs22hUI2TbTG4yzpnUjHVZS9x7s+H4Dz9UtDgtgo5I
         DmYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LsUei+I8aVDj4dV0HZrZbWcRHocIt2pFuCRFx/b8TcE=;
        fh=RCjyYmsJ8uA4bABRgIZAEYAnIOTYiHh1/ffXLPIvtK4=;
        b=sUnGZlNtGj53Dgi6LSYIbWyCiC2IYI9Zsds2RyF2YldHvBFkq6QSJoJXIK6jHmkn67
         oGd/Shb4RtJghDKVkaaJE0KWkUaqOBZhN+HgMn8wD+d2BmrXl3Mn6juiP22Lo9GhuO4A
         apcL8xdIMg/1kalInD9NgtD6lJA1H26HJ1UCC0Tx5inN/nJbPKsnkrIIVMtVT97PMYsT
         /oICklQFXFfa0s+eYoEoqr37CN4xvz6I1q0huJtBthvMvadGsjF2mCZoPBuKNSoihAho
         TNVRN/TN70+4Uc1Cf0Ydkznl+ObzLlPnPIvZUp7P4H8Nv+jab/564y8OGoIJ8Vw2hEic
         Y2oQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785134375; x=1785739175; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LsUei+I8aVDj4dV0HZrZbWcRHocIt2pFuCRFx/b8TcE=;
        b=ffcjKojYiuC94tmUMPlGmDJ+Swcv7pCqnwPgsImNJbU+UUzcTuTfSB1y7AvNWh307l
         kOtchr8DVx0yPVc3MR8+5eO0DHtKS9aabl80T77JLntTQNYORH6qe18U2+6AUjE4iCWj
         1SaonZ488AuCJqu2UT/KMRzvGegWYPpmFEDxFzC5+/PVcj9+bCXB6kQjla/0IsXNwK/D
         oThwsGeF+75LIKAoKMuPlGKWzuPMGaxxWmhfhIZfb72V+J3sersel4txkQ9guDPyrKCO
         /sq2FZmlbPy4T0Ec70s5JXOdhO62SE8gM4kS/1rOXPDXwlsDm3dCVdelPqvIqecd/sh6
         kurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785134375; x=1785739175;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LsUei+I8aVDj4dV0HZrZbWcRHocIt2pFuCRFx/b8TcE=;
        b=K1fHgK+RZoooT7ZQTlu/PIUJxn0VEykgpqLaVWX0BC/MHVEpm1c/DgOG3owdCfxQc7
         Bixr9v6blqINbW47JR61d5qKXIQuIoGSu3DFN+iK3jTYxLyQ7x8snb5Gn6qdfrdqYaWk
         nElc3Hjund7YPy0B69B+OM83pM4foZA+pG+dbyFMi9KuNQnPjJBjgxcQXBr8KQbplI08
         zGgMa1rBLknyok2n9a0Gm0QAY5jSJ5VXRH8r7kybYHZFPzb7JYy987hYk6yViSgMbt8v
         5AX73EV9tghleOQp86pCKG9MCMStGwplrWNY9lcl0afjq1GDIemFx0eD/b+ZOTmjeZs9
         6MBw==
X-Forwarded-Encrypted: i=1; AHgh+Rqbgd0WfNpaqTTHiM0OOvHdVvTFk+fOr8AdqI9jI6Syllp5QGdTjyxivbZlEjKVEkFHPN5NjJMGBAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcAp4zEy0hZSEYKgBbTdfqQY0zZX2bZlCghxIv4JKZm4pk76/t
	BNVoKS4fDpTQFa+b/tcBvje/7ef46eoKOSgYycpyGWW34auxC/nnlIxBWkL+vvo2mApqSdD9TNR
	+7X4ufa6FLmVMscT1jXwMOESdURfNRL/hgWsY
X-Gm-Gg: AR+sD110JKnetIYOq0N6ZJrh3f8MtPlPpAKgEZDu7Mr9A2VwjaFKeZb9lqUykwT/lr1
	+rY1BWbzmNKsP8/haMM3Je5pZ+1mPaFSzjU2gVtXymKLIHMjjAauOlyHMnq9Ra+T6VulswhrOl3
	7tfe+9Mxr961yAR3KpxtNJFKAKyptBVtce8ultJDP62Ww1V0tL5CkVHWb98QpFfdfeaYxZ9Wuxd
	1Bt8UTs9FzVb3W5GjoxX3Qeuh6bVKIOGEvoU2yHArVWVl/weMRCc0wQXQXYvKvP9aXvc9vAEhEq
	pkQp8qIrxMoYtdY3lWKPDwtDsz+zLENBr69z69fSiTsZRBl/IXsjVwBuOgeTjiBZ8u8oQDu6HQ=
	=
X-Received: by 2002:a17:90b:57e3:b0:38e:a74:dfe4 with SMTP id
 98e67ed59e1d1-38f29608b42mr6912166a91.25.1785134375396; Sun, 26 Jul 2026
 23:39:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724074603.28731-1-phucduc.bui@gmail.com> <amO10zgmVG2dquks@redhat.com>
In-Reply-To: <amO10zgmVG2dquks@redhat.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 27 Jul 2026 13:39:24 +0700
X-Gm-Features: AUfX_mzjZcn1HrLpGmS7rJdmHuzzcxNREBhBZbXtkdtB4vJS2g-mkeTnNC11ZgU
Message-ID: <CAABR9nHjL525YozSibyqrcNQbmjiV=+oa2nmEUaSKE9koXaanA@mail.gmail.com>
Subject: Re: [PATCH] clk: versaclock5: restore cache_only on regcache_sync()
 failure in resume
To: Brian Masney <bmasney@redhat.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

Thank you for your feedback.

> I don't see precedent for this pattern anywhere else in the tree. Is
> this an observed problem or something that could theoretically happen?
>
> If this fails in the code today, the pm core will propagate the error,
> and the device won't be marked as resumed.
>

Fair point, there's no precedent in system sleep PM,
though runtime PM has a few cases doing the same thing, so it's not an
entirely new pattern.
This is a defensive fix for a theoretical case; I don't have an actual
bug report for it.

But after a failed resume, what guarantees that no further regmap
accesses can occur
before the next successful resume? If there is such a guarantee, I'm
happy to drop the patch ,
otherwise I'd lean towards keeping it.

Best regards,
Phuc
