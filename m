Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5132580CF
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 15:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782402395; cv=none; b=Yonpk4X30vSefgAZZa0A86Y7aL0+cn0HZiCk/TslB0292Y1yU6DD+fN490gOctcJVXC4pZxv5GYXHbTWZfTzkFHF6C4O2J/AfF4ZPvvh6apC16mkr9n/ut23FFwfrW/OwyxVw2THpqkJJAm8TlEHL+RL3clqT2S20fIk7WSvR4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782402395; c=relaxed/simple;
	bh=e7lrIAFkg4k6NUz4GB4/viVmcTMNb1bb/B50O6P+jo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDcVsijs6xcUPrHANFWxN2lPxI+A/aWG1pZuomhz4IA0EOQbhV6z4qzQrl4oJF+uS9Uo86ElmLZNirncfz0inJBQjmwnCn/px9w6/CIbzOboFFfJzF+O/YSmStmN6KrhH7t4DZbDY3/Tw3w1T2XQo2W2w8blbMaNBMcIHagK0/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xmzn0d+v; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tozHxbJN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xmzn0d+v";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tozHxbJN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782402393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jM/6IbzqvJCPoYz/NAQiInzHFTEOAc9/37liSmei6M0=;
	b=Xmzn0d+vXqMI67fupaV0h5AI4tmeVtuCDwerRkDDFCW1Uvo+J73pK5iJcEP02Te2zBscb8
	JEkxx2dS3tqAe2XtLeZMWiKsZ+IfSUGRed1/z/33Do5Pds8IwZQSh/YhuHIarg9fxbYPc4
	eNyCWQk5+AR/+7fOhP1qy8gM0GeXwHc=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-d_MGbZhpODezN5CVOT21tg-1; Thu, 25 Jun 2026 11:46:29 -0400
X-MC-Unique: d_MGbZhpODezN5CVOT21tg-1
X-Mimecast-MFC-AGG-ID: d_MGbZhpODezN5CVOT21tg_1782402388
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-96828bba695so319050241.2
        for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 08:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782402388; x=1783007188; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jM/6IbzqvJCPoYz/NAQiInzHFTEOAc9/37liSmei6M0=;
        b=tozHxbJNUBp2HMma4N/8tT/Gegv/AH79tTedRQttlZL3bPWcYjuSOxQHVeegEtJc8S
         IQoes5PL+oo94qBWF5PAxEQ508Yq0B4KMRM8n9QXWZ7SrqKgyd8IcnznT1Tt4+m1lgXq
         +LRftBHbvsqOybHE3KHx7HiAQ6U/sMX1lks7Ffz/8KKWg55AK/aMVlCsq0tk6zfSM++d
         iOvpZw9am6FW/WjgBYIwo1MPeNVrNW6gSkQDHZdedmHWHcJq2rz9ekd2cfgs2MWul6NB
         W9Ro6LX/bLyyhQSvyHP3mGfELILTCazLvfFwBackIFJiTnT86XvEWwRArOkCaTTNL1Zh
         /TQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782402388; x=1783007188;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jM/6IbzqvJCPoYz/NAQiInzHFTEOAc9/37liSmei6M0=;
        b=edgHjfkRdA7cU+ctKU4rgKI9gqAmoxdB/TDwbJblw6iE2RQz5qsBMsa6BOAQXiM6yw
         /h0yOceytYB9BtkpQZllTGK69WKi3jtqPv7W632aBJz+FppZ2q8b8u22bSj0Qh8S6Pns
         3XxC7e+Is0T/a4/cgmrA8SL6OMx5r/MEVLRR0VcDlUdwj7NrffnBfktGo6jceLYVAt2H
         pf2OKSRJstUuVssmGmtfupaxYNcOMfkW+I+TCjNO7qxfRyoxN+EjUkBZncEWSCdIu9W6
         8DM59Q6jf4jxNZ9L2oDWLdIHcZ/J+jCMbL7rLJt3AtmtKjuGaZeESpaXhMm8vE5qSHWs
         WwvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKsI3vOJGVd1JTxAaPnMwtuMFnFnFjWEdtWi0LJv24SW7Q/+oqb18r3yJnm+UewV7uZq5GCXE4sCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFBut6bkVAxkNmjmxFe2Ul9nLpK1EpEJ0barvjsEbdhGSxjSBY
	u0PUTlFjeL8rfBBX6epnkVyTwhLvUID1L682+RiTTQM6jZ6vXDl/DpIg8uzhz7dn9r6TDk5Ifnd
	3Y/D6XQcXLrY/71dlOJx2fVS6lKO3JDhcTJacf1yEeT8Cb0X/HEgO6M3hHLM4kw==
X-Gm-Gg: AfdE7cmHmqWShdpFfOXimOSzhlN8wwGvNKfYS1jd5t5FD48fDwVMJ2RpARcZ/CsCcb4
	4VI2lH/vVItV2C1gYrbXrGzHcrscgtPAt/K4vtbWHqI5PvMu8z3EvUOIoPboWerjB33SoBOecPj
	ZTDNN+1OLzT3mr8YJvCdRLPFP1CFNOzphBaoBw9YyxnoST+slZFnQ38bYdibOpBaANg+F8zP0W+
	WaIjZJJ+Npuo7QrAFsvKk8qkh7JrTRgJ7J6LmmW6JcW+wK9TzgB5FovxHP9hPN0bZyipmy9P0i1
	9GKd0BnUWKD7H5v4IttZKjj5F1jFQvMUx9kU6pL34mvABXihmTf9o/MH8Y/Cilu/+QwrSWxU1cr
	b6H9D3mLWyg==
X-Received: by 2002:a05:6122:45a0:b0:576:c4b:460a with SMTP id 71dfb90a1353d-5bd69ccf938mr1348725e0c.8.1782402388199;
        Thu, 25 Jun 2026 08:46:28 -0700 (PDT)
X-Received: by 2002:a05:6122:45a0:b0:576:c4b:460a with SMTP id 71dfb90a1353d-5bd69ccf938mr1348677e0c.8.1782402387664;
        Thu, 25 Jun 2026 08:46:27 -0700 (PDT)
Received: from redhat.com ([2600:382:7704:278d:3d06:53be:855f:1554])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfb89a95dsm13827359e0c.8.2026.06.25.08.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 08:46:27 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:46:25 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] clk changes for the merge window
Message-ID: <aj1NUYRrD30ctAbt@redhat.com>
References: <20260625151438.8471-1-sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260625151438.8471-1-sboyd@kernel.org>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hey Stephen,

On Thu, Jun 25, 2026 at 08:14:37AM -0700, Stephen Boyd wrote:
> The following changes since commit 2abdc3dcf9780d070e55a99fdf8f93440c798b84:
> 
>   dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile APE6 (2026-05-15 11:26:26 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus
> 
> for you to fetch changes up to 92010229c4b38897f1319d260162d2f96925ed17:
> 
>   Merge branches 'clk-microchip' and 'clk-qcom' into clk-next (2026-06-25 07:55:47 -0700)
> 
> ----------------------------------------------------------------
> This is all clk driver updates. Mostly new SoC support for
> various Qualcomm chips and Canaan K230. Otherwise there's
> non-critical fixes and updates to clk data such as adding missing
> clks to existing drivers or marking clks critical. Nothing looks
> especially exciting.
> 
> ----------------------------------------------------------------

Would it be possible to also include Benoît's support for the Mobileye EyeQ7H
SoC? He has a pull ready:

https://lore.kernel.org/linux-clk/h_BA0KRKTGSANQ5Y4eqo6A@bootlin.com/

This also wasn't picked up during the last merge window. We push vendors to
upstream their code, and they point to situations like this when they tell
us it's too hard to upstream their code.

It looks like this was mostly pulls from the subsystems under clk. There's
also a bunch of patch sets that I reviewed this development cycle that I feel
should have been picked up. I'll send you a pull for that.

Brian

