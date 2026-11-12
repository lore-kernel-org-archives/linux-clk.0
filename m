Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502987;
	b=w55UGMFe8Ej00nmipvXSUrRJDtJT9CZYNu50WBqVKOrW0UY0cn6vTQXbezzz6sIOtGet
	 ZBk/EoURe8te+UBlYc17uMVk3IoCt8fAQ1fD7dZvuo8jQ3cKZ8E7AyLbcQelWRVhDuZz/
	 qtllu0Mq6IHXA6Wc//eRyecGWFEYU+DyayRqSk8enGxUQZifG2KW+JYeaXPB8j0Bg8PZg
	 D+NXKDWCRjRQzR/2omoOxO9K2bYRKXk8F5oUdHOVah/GU6k2L80h58QzhaKILUib6NT3M
	 FXNWDMFs+7XonMazezUH3ZJ/bB8eSZsu8lD2hwOActPVZUd5eUgqoc0mHMSeQQp/Bvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502987;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=3W1A4BQMOpN9nFxHb2rXE8WHciL/muN+wSYPGT+qRXs=;
	b=1xxd9MHm0zMlpgx2u0IgTvS9FHr8Iz5FR2eDtaoHs/cGwuFAOxs7bfZPg/dgVQkkNwOL
	 pIU+Bw61KN0UgzQqQnor6QkoemqaHbxnjbnKEN3soYbHslGsTlK0v5hM6HtSXkGn+TQk3
	 ftxlG4qdV1h0sx1viUONUJT9t/iX7Ix1DIEIWmMCbjrPzNKvV0nsv3gjmk6F3n9ukgpf6
	 n3pAubDFJ6fofXmnr4g3Xm11c5BCO6xaIfe9HU7SCkDgmeWgzP4T4xzm2crZY5LCbowzz
	 YGNIveeTfeiLu5KdcvRqdn3r7DeJjdkQjaPuM2kdD9/Z2cJNtQQHGAUQxzFu2gGOadw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D3C606A31C
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 17:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9D3C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so957834e0c.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 09:03:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502986; x=1795107786;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3W1A4BQMOpN9nFxHb2rXE8WHciL/muN+wSYPGT+qRXs=;
        b=ALuwfiG6B0LTy8SjvnKqPAda+t60WXg5Bv9+d8wpERZRnNOny+XtIifsNY/eVhOSLq
         PmLOqKD9ipTLtZtEx7aB0APjiJusrUP2t8jL3tb3S+66Ktdpvb4Goj9zAqkeJkafA4DJ
         xpfm6ngUqImQjDLmE1SwblKQc3TcVadm7d515OaIhMNje25DegxSCwi+03Iib+ODV2pm
         s4/hWXAsd8TQHuP3r8ejmk0aOpbrWP3ocFpB3eE98+W3Cfc/+5Y4oxOnaYx+WUHVOqSf
         85GlqWLfiRh/BZznGqFEXMTTdknhOtL+X7hwzTSV7IyNb4NOIusBZ6GEIszAsstodrfF
         K2FQ==
X-Forwarded-Encrypted: i=1; AL+hErFr+ARVCnVSX0Zkul42Y0WYCQV299Mrhh1vN1hUODogcTHaGD1lyg8xdvaXDcosYeydy+etPTn6Pro=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fdHr2Eg8igLxNTcrhrOqMMlTiXjYyU5/aClkwrdiTSIUCSzk3
	tdEjrZvArs001IwbKgg7topyZ2KawSMrwsvrQDQ1UeBcn+0Scz1afEOIEuLPgmoWZlk=
X-Gm-Gg: AYBFou2FP6wviTnW7OjsrQTVhU7pPRL0/+ZwBiAJFMg7nYhQ+6OjE8U46J4dfctBKN4
	hG8xdtIBg/a2Zk0WCrOpVQ4XNrAKFoUeu8gT+LEUanAf2XpWwU/9C6SGY5sRpL79hsG6bZJqqAP
	fEvXtahNZIGrTqHOjWPDxoywlDCgIRr5LNkmdaXa9DE5UTRbirrthPbe6tnSvHtqk0ZqTchyBNF
	pMNUFULSTfstJitkO5DADiGse/PPm0C4WiIyFwnfmq7fP/gP2ih/RVLZVPAI0LAT3Tz0zpr82uV
	yZlqAci2QXaURmPDa/HzsQQC2DXoNmbVU6MhMyj82qD4lZd+9Stusmwc5X0xE4xVmyQ5W/zggKA
	f7vGSeokNx+R9QMBNrOEeNKdYZsZaiiJhcbZJy7W+Fq4ZiilQG2u38WEkRft14V0yz/iXs4EcMs
	YmahEUNQf4HrmsjFwu19wTN2GHld7mwpltWcdzgWz8RucqyFQIOJtAojx/DFbkvwnDw31VA7yvW
	pkrpMChRE/VJ0CU10BrA0dWB1Q5VrH58tcNmLgow6a8EcjbVMn5GB0LhKP9W1jHPBkkG+SyTpCh
	6jqXWkwcQ3bJmfXu2mZBXzF7Bl9WMXMXkcsjLHlZDVmsq2qB5o8zxw5htxFj9g67x7ZjX1g=
X-Received: by 2002:a05:6122:510a:b0:5ee:52a:f480 with SMTP id 71dfb90a1353d-5ee27434e9cmr838763e0c.9.1794502985659;
        Thu, 12 Nov 2026 09:03:05 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee3240b829sm309053e0c.5.2026.11.12.09.03.04
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 09:03:04 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eaa5e03c47so901424e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 09:03:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEuT9jLHaQq/xU0WirxxOKfQ0NM8Ai4JzDKPftmaGsGIskL8LB8lpkDwV/8XoduQrmMn4wRFG4BO50=@vger.kernel.org
X-Received: by 2002:a05:6122:510a:b0:5ee:52a:f480 with SMTP id
 71dfb90a1353d-5ee27434e9cmr838741e0c.9.1794502984448; Thu, 12 Nov 2026
 09:03:04 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <e3b9d76d5b4a254d561b6e734423063e94225a28.1792163045.git.geert+renesas@glider.be>
 <sashiko-outbox-174603@kernel.org>
In-Reply-To: <sashiko-outbox-174603@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 18:02:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWb4UPKhcFnRG-dta5KvDUV_cZzWrWwaD2D-vGnh_qtSA@mail.gmail.com>
X-Gm-Features: AclHuK8ZV6Kxtk9Z6yJfLydeqQiC4mysO9PUPwmC0BbcDagci2s6Qg-Q4JhBB4c
Message-ID: <CAMuHMdWb4UPKhcFnRG-dta5KvDUV_cZzWrWwaD2D-vGnh_qtSA@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] pmdomain: Make genpd_get_from_provider() public
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Oct 2026 at 18:08, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] pmdomain: UAF due to un-refcounted genpd pointer export
> --
>
> commit a7a3a37d2be118bab420ebff1f13629dfa676eb6
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> pmdomain: Make genpd_get_from_provider() public
>
> This commit makes genpd_get_from_provider() public as
> of_genpd_get_from_provider(), allowing PM Domain drivers to look up
> generic_pm_domain structures directly.
>
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 88c886814a5b9..4136368456d99 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -3018,8 +3018,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
> >   * Returns a valid pointer to struct generic_pm_domain on success or ERR_PTR()
> >   * on failure.
> >   */
> > -static struct generic_pm_domain *genpd_get_from_provider(
> > -                                     const struct of_phandle_args *genpdspec)
> > +struct generic_pm_domain *of_genpd_get_from_provider(const struct of_phandle_args *genpdspec)
> >  {
> >       struct generic_pm_domain *genpd = ERR_PTR(-EPROBE_DEFER);
> >       struct of_genpd_provider *provider;
> > @@ -3041,6 +3040,7 @@ static struct generic_pm_domain *genpd_get_from_provider(
> >
> >       return genpd;
> >  }
> > +EXPORT_SYMBOL_GPL(of_genpd_get_from_provider);
>
> [Severity: High]
> Can exporting this API lead to a use-after-free regression?
>
> of_genpd_get_from_provider() returns an unpinned, un-refcounted pointer to
> struct generic_pm_domain whose lifetime is managed by the provider. While the
> commit message compares this to the clock subsystem, clock pointers are
> refcounted or uniquely allocated.
>
> The follow-up r8a78000-mdlc patch demonstrates caching these genpd pointers in
> its power_map without acquiring any locks (since gpd_list_lock is internal).
> Because the SCMI provider is looked up dynamically via
> of_find_compatible_node(), fw_devlink cannot automatically detect the
> dependency to create a device link.
>
> If the SCMI driver is unbound (via sysfs or module unload), pm_genpd_remove()
> will free the genpd structures, leaving dangling pointers. Furthermore,
> overwriting the attach_dev and detach_dev function pointers of the SCMI genpd
> objects will lead to invalid execution if the module is unloaded.

If the SCMI driver is unbound, the system is dead anyway.

> [Severity: High]
> This problem wasn't introduced by this patch, but does this internal caller
> have a time-of-check to time-of-use (TOCTOU) race?
>
> Fetching parent_genpd locklessly in of_genpd_add_child_ids() allows a
> concurrent pm_genpd_remove() to free the domain before gpd_list_lock is
> subsequently acquired.

Ignoring pre-existing issues.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
