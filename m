Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C663054C7
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 14:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435674; cv=none; b=AMmy+R6rb376Du2vvEJ7lRyRJbUCkOJUXz3RHsgsCYrHWIBvmPwROesnAAIeugNvmx1lmnzonr4wui1+vUVdZ5ZH6Bz9d167Ramq5AHcduK8eefta5iUGpaN+QzhryE5Z0k+/FQtLe0Ye63CIzIo6BswNdqzo468ReXdf8M9v3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435674; c=relaxed/simple;
	bh=+z+gxYFlPtHgHZIMkVwjSgyTxL0CHmGy1/FkcqoL/Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e677ulEgIw4uzECzeKWVKkNtXcOvoK3ezANnYwqf4uh5wlMSQiEAXvkv7IhfKIO45aOQdV5mvkHnpO+dNCbiEV7TeK4CwH7QVEmvoc5RwqNs3gbme80Kqei/wbdSkaN/QmkGghovzeC7795GeAtu2XasH0mwkFkyIoSvxcBDpfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JvE7aHLC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eteJ0Loe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JvE7aHLC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eteJ0Loe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783435672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WrZMujM7glJ2AgSACwXIbeDVc0Wnvusn0xlE1OdCrOs=;
	b=JvE7aHLCdDf4j6IAi7+vcKYRLx9J85Ii6qXGpPQ5xHZO5uEOSCYGNIXjtpWirWG0BPNmsP
	lnoDiV02peidlMp2qAytKyIMdVTL3gclPEjhTyCNQWwKpg0OBiAsm9xxzWIDN1TCClpllq
	kR6TJ0N8w+jJfqEDiMD8dnChsnnQwG4=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-PHya4EfAMKuDGGPVvLb7Pw-1; Tue, 07 Jul 2026 10:47:51 -0400
X-MC-Unique: PHya4EfAMKuDGGPVvLb7Pw-1
X-Mimecast-MFC-AGG-ID: PHya4EfAMKuDGGPVvLb7Pw_1783435670
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a17ce8b08dso2079850eaf.3
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 07:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783435670; x=1784040470; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WrZMujM7glJ2AgSACwXIbeDVc0Wnvusn0xlE1OdCrOs=;
        b=eteJ0LoeuaSPwG860ePg0DzJViCHBV2q+TwCHcjSF6IEh8FXwdnpbBa4TkHyjBXyol
         BUE+DvngLVAWraZ0PKYPLlAAYPfDu9HQxubNoNIqGJm/XKpwSL51zmPDbsZwwQ8VDgYn
         qICzr84yeShse3mvhnpnGm3RkjTwq3GU+tTG0Eh1+9lMLAxPMOTAssq9oUUjRcBv1/jz
         TAw0eqHLVtOCCETSuCKZWjuSRqWmYk9d4EnKj6Ap3Glngt1LVEOTRfGyHzNmyCbE5BEp
         OCgygqaxj5Ho7OfvQ9QsntT9DAfd3E9/VgExTI9AgndG63gfbZ5TLScOBqxqpEkJIQgO
         qvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435670; x=1784040470;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrZMujM7glJ2AgSACwXIbeDVc0Wnvusn0xlE1OdCrOs=;
        b=e31rlewodKypja02Nh9C3UzB0/S5dPK3VVregWiDD/X/Sa9z93RIfZ690ZBN43MS6U
         XfzoP+43wPp3/rD1Vq4uMb+o1YgYo8BOZ/eIUmyMSar3Xy0VfWli47MqA4LFJpi9SCEU
         ne+0EIzQDWNCw7UQEDAS2dpxmQ3aexZ+hnhERwMg7MNEfyIM5atGfMnMkWs0/mpjWpEe
         Z/GeZGTGEzq/z9Ace1Q+Xr6ee0jpykF3UKmXGCUIQFrTLJPWncXVBfLIpCrnKCB8SAdP
         CIhTzmqGx2M5Q6KQ2fuIGBEjdgkOFa0wMtN+aHMNFD+Q99NJJr3ifaIMwvfmChKzz4il
         oC6A==
X-Forwarded-Encrypted: i=1; AFNElJ+7TQQcd0BHzJItlUeOyxElfLkv3wL2c/ALS57zjkMMQu8oBd3mcqudqY2GFUM/b3+waP30C60gdHE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1aO08A63/TWRC8qUBL/NqRDB0zWFXlmEVsbLZkDKy5PTi/fd3
	Kw2C8LQgVE+MCS2+UJ4kr3JKAqV1dpxcn571D33dymyzLy9UJTGVpjdJTJ/xN1f6E1eCUTWZaI2
	R0JnOCse58ivvFvuIztZ48R1zPIA6H3yaCB/pGfaDXCFm638NbWE98sBF3PQF0w==
X-Gm-Gg: AfdE7ckdX3x2AOOf2Rt1YWw903b2J5a7i55wRHRFey2GDQF6jOYziUOrC3J0645bvW7
	dO+wA82LFT6720gvrjNXon9Md8NW05HLhI0L3/T8t1RbhP9MSLSCiL9mHrbjXrKm7CKxo6nGRIH
	JtPEMb5Xqq+sDgnMzmtESjwqyrpi8UeHMnUwUZ499j7PLVa2zRza+FOwEf0m7jDEdT9hx/g1rhC
	M8Xa8XM2zZ9fR+YtoxHmZE+TCoODbuGprCnfhydBSyM5K8O+G/zUQnAgy/qasXkukKUrsRiRRMU
	bK8H+j2Z3UUYs8Q84aYCVt3shyWowXIp63Zm4vkQnXjNkZWD6E10UempgnaYrlFB/nKandVhmFT
	M52Elxrdu
X-Received: by 2002:a05:6820:818b:b0:6a1:87cb:c34e with SMTP id 006d021491bc7-6a3555125fdmr3682536eaf.72.1783435670193;
        Tue, 07 Jul 2026 07:47:50 -0700 (PDT)
X-Received: by 2002:a05:6820:818b:b0:6a1:87cb:c34e with SMTP id 006d021491bc7-6a3555125fdmr3682515eaf.72.1783435669460;
        Tue, 07 Jul 2026 07:47:49 -0700 (PDT)
Received: from redhat.com ([2600:382:850a:55b4:731e:b0d4:e0cc:410])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a30ff8e0a0sm11018754eaf.3.2026.07.07.07.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:47:48 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:47:44 -0400
From: Brian Masney <bmasney@redhat.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	stable@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2 3/6] clk: mediatek: mt7622: fix memory leak on module
 removal
Message-ID: <ak0RkDJr1FO0BCoV@redhat.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-4-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707074839.240676-4-akkun11.open@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Tue, Jul 07, 2026 at 04:48:32PM +0900, Akari Tsuyukusa wrote:
> clk-mt7622-apmixedsys.c and clk-mt7622-infracfg.c do not call
> platform_set_drvdata() during their driver probe callback,
> but their remove callback calls platform_get_drvdata().
> This results in platform_get_drvdata() returning NULL,
> which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
> This leaves clk_data unreleased, causing a memory leak.
> 
> Fix this by calling platform_set_drvdata() during probe.
> 
> Fixes: c50e2ea6507b ("clk: mediatek: mt7622-apmixedsys: Add .remove() callback for module build")
> Fixes: 838b86331c5e ("clk: mediatek: mt7622: Move infracfg to clk-mt7622-infracfg.c")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

