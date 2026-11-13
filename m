Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582819;
	b=p/riHRgIJQ3Ck0P7gqTV93ksYSSjKP5zslEuR9EULH/mQl/k8Pzij50vGqRcTWKQ3SnT
	 0WTIjqxQ4+nCzf+eMogT1JPpNafERF7FwCDCiYacxHacJT4HcBQpNzcfbtz0NJVCub2tE
	 EuHCWCcIguEZ1639REFYLHihgLIjhIRGTzCPQK/8wE1QAKFdG3nvmuNpu9NHxgLTDMgO3
	 KwuPHAAK/ru9z+Su12XQtfHwvd9wjhz/Kho5pDqLGtfGVBRmvUMP6ZiRUcSWQD+nNcJmt
	 neacaKboZKRFDBGxqJExC6t5voFhyzIs6yzIP1QDnPBK5kom7ESmffhKza6nCRniU0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582819;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=cVOOq3RPpxrIdRrjnzQ+Oq5IwAudXg3maodPAIwZDdk=;
	b=ps88uGOkIjO7y+CH5nHO0a+zo9ubCmWugGdQeEM28eCKXEUFRP9s/KlV+LSYBv+yzbt9
	 eDY4eLFr5+0FR7NDwure9ogKFt4lSwP2VUF2om1+UX1TFjOgnp8z5h4zVhHFXvaRKwALF
	 kyReZoz2322qhRroxlm5q3Ad2cJOh8F0iaJTTgMoc3ZTLIR2tozVd0OJmh5h6MhwIWUuP
	 2rfIRMCk8aVow+xkd/rG/4trJIPi/vA/D5k7XnrTAqio8fjJBEs5OIdqDhjEqmgrtixGa
	 40kR3/WrsVKFnPiPShW9QA7eIcV5+WmpJLqTdLgPl6jt5myUpTUtzp933y8n31Irb3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3D3606A323
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 15:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF3D3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4697404c2bso188106166b.2
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 07:13:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582817; x=1795187617;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cVOOq3RPpxrIdRrjnzQ+Oq5IwAudXg3maodPAIwZDdk=;
        b=xt7woRi2uKQjoye6ySCn73m2NiJyLV8lloOlIrxs/Jlz+K+0IdxM+jERPr8qWr3Fpy
         HNa6fpJPDO2knaAjZbsyiAtviiPfT8y89CZ3gvBLQ/I5hiiNJC26Cc/eH9iFYEBNfosG
         0XASXQAd/VPUwUE4eyqV1zFmwws0ZSqE6rHCo4nyV869rly5fdJxI60xR548vpP3MQpJ
         /1R9UbiS/grbtYLhm63FCNQ6JwaHW+hcyKdiiQ2TtueO8JmhUhkPgerTIJsbxGN67LDT
         R8Mw0lPMXXC3CYVeJTp6P0BhlQAW7jQen55hJYJzQ882gugjp7BNMGJKfqBZp90hxX5T
         RfMw==
X-Forwarded-Encrypted: i=1; AL+hErGcwNaNLt2fAkxfzWFzyufHhgDuaQDV4aw7TYXuFfRnG4e1cgx9xC0FEW5ewiEJMjBPKTROsjtPVyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7y4f5iwpkkOYkMnbX8DRlrtQUWIqJGjIcZ+ZeBPsKDSCJY7UP
	pWKQuX9pMM2q6JDMfO8OXsgKY4io+sD5Qrfo5pRw/QUEzpYOVyAOL+EqR/VocTCUVBo=
X-Gm-Gg: AYBFou1A9V3pAr+5cEMs/y/GZos9HwZ4z/fldIwA5Edl0ZSOdOp/meborMBAYMjrNoV
	JTxGgUnspNSTQHAuFebsC/swfC9+8akrpcRSARU/lqzF4qIOliyJmlR7NGurqoSqv+LHdNPx0vF
	SrOHmzbeeJPSAsLwUWfPsPwNYWXaMKstpSoObaNmBU6gvd/2G1aahN/RGhlSmWdWig1/IkN3mxK
	JD+gWLuueNYjGFEoayRasU5hRA09lHskcm7+NZJ5vkIi9XaiORDGVTWS1Hw7VHgS1tX5b3abP1o
	+DjXJS/MMBHdD3Wh9kfNKxDkt6CtMLlTEmbEfQ9oFUi5Jaw6cEwpszArWRqoDERxtjSRTrhTwts
	ntA4HXBhWO/EqVhSxmrzbtm5qM+cuEdi44sp/XJhTit2I4jIYXMIREtQb7FCWuAreNqq3bHlNV4
	QtwLr+yULSLW58EdryBtEClmBtyGV4iqO8B7ETuvJB6t8u0wRPC/be8bAt1yJy1uXfHXUU7wa9Y
	KYIQxZHtqFAsNCmzz2G6jRiNQmlmBlThFflbiSvFxMyglIMEhdsL3dHAfyD5yiKRBPy8Wi8p/xK
	CBiB8J72XMEw24hm6R9ZUuEKKZAyrWIF494UK2G3RGarYTnXbuYmWO0jYdtiZB+Khww=
X-Received: by 2002:a17:907:3d0d:b0:c46:7fa4:922b with SMTP id a640c23a62f3a-c509643babcmr228218166b.33.1794582816740;
        Fri, 13 Nov 2026 07:13:36 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b7csm113827866b.29.2026.11.13.07.13.34
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 07:13:34 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d30639709so201418566b.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 07:13:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH25cwOjyDo7jk5TeGP+WjfTBvojDAfm+5Ob3F++w59NbWJdT7JF/DpE/OUKU8DqSSyDj7dT3yJf3U=@vger.kernel.org
X-Received: by 2002:a17:907:3f23:b0:c50:93b6:52fa with SMTP id
 a640c23a62f3a-c509614e782mr243931466b.2.1794582814183; Fri, 13 Nov 2026
 07:13:34 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <2895c8f3cbe718dc597ad25e16c2461f0d681ab6.1792163045.git.geert+renesas@glider.be>
 <sashiko-outbox-174618@kernel.org>
In-Reply-To: <sashiko-outbox-174618@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Nov 2026 16:13:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWRmqp_4GhyMjNBMFZULiF1ihKSCmiiVzLFG9L9aC=EMA@mail.gmail.com>
X-Gm-Features: AclHuK-rhaY3W-iKou3OxdeSeto8XUZuAfuEblsDGz7eRhtlFv6Qzoq4TAhS1Jo
Message-ID: <CAMuHMdWRmqp_4GhyMjNBMFZULiF1ihKSCmiiVzLFG9L9aC=EMA@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] pmdomain: renesas: r8a78000: Add SCMI remapping support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

Hi Sashiko,

On Fri, 16 Oct 2026 at 18:15, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] clk: double free of parent clock reference in error path
> - [High] pmdomain: renesas: mutation of SCMI genpd and hardcoded index 0 in attach_dev
> - [Medium] of: memory leak of scmi_clk_np reference
> - [Medium] reset: memory leak of exclusive reset controls on error and unbind
> - [Medium] pmdomain: renesas: out-of-bounds stack read in r8a78000_mdlc_attach_dev()
> - [Low] cleanup: mixed goto and scope-based cleanups in attach_dev
> --
>
> commit a125fd15fada610e74f2b15cf0cafd68482a5100
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> pmdomain: renesas: r8a78000: Add SCMI remapping support
>
> Extend the Module Controller driver for R-Car X5H with SCMI support, to
> remap hardware power domain, module, and reset IDs to abstractions
> offered by the SCMI firmware. This avoids putting SCMI IDs in DT and
> supports fallback to non-SCMI defaults when needed.

Thanks for your comments!

> > --- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
> > +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> [ ... ]
> > +static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
> > +                                 struct device *dev)
> > +{
> > +     struct device_node *np = dev->of_node;
> > +     struct r8a78000_mdlc_priv *priv;
> > +     struct clk *clk, *parent = NULL;
> > +     struct of_phandle_args pd_spec;
>
> [Severity: Medium]
> Is pd_spec guaranteed to be fully initialized?
>
> If the device tree node has a malformed #power-domain-cells < 2, could we
> end up with uninitialized stack memory in pd_spec.args[1] that is later
> used as a module ID?

The provider is matched against r8a78000_mdlc_list[] below.
If it is not found, pd_spec.args[1] is never used.
If it is found, it must have been looked up through
r8a78000_genpd_xlate(), which did verify that spec->args_count == 2.

> > +     const struct mod_map *map;
> > +     unsigned int id;
> > +     int ret;
> > +
> > +     ret = of_parse_phandle_with_args(np, "power-domains",
> > +                                      "#power-domain-cells", 0, &pd_spec);
>
> [Severity: High]
> Is it intended to unconditionally parse index 0 here, even if the domain
> being attached is at a higher index?
>
> If a non-MDLC device uses multiple domains and the MDLC domain is not at
> index 0, could this look up the wrong provider or silently fail to attach
> the correct clocks?

Non-MDLC devices must not have power-domains pointing to an MDLC domain.
In case of a wrong DTS, using multiple domains with the MDLC domain not
at index 0, the matching against r8a78000_mdlc_list[] below would fail,
and no harm is done.

>
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     scoped_guard(mutex, &r8a78000_mdlc_lock) {
>
> [Severity: Low]
> Does this mix of scope-based cleanup and goto violate the cleanup subsystem
> guidelines?
>
> This function uses scoped_guard() here, but also manually manages cleanup
> using goto-based error handling labels later in the function (e.g.,
> goto fail_put_parent). The guidelines suggest converting either all or none
> of the resources in a given routine to avoid LIFO ordering bugs.

scoped_guard() only applies to the block inside the curly braces.
There are no gotos from within this block, or gotos skipping this block.
This function also has no other instanced of __free().

> > +             hlist_for_each_entry(priv, &r8a78000_mdlc_list, link) {
> > +                     if (priv->np == pd_spec.np)
> > +                             break;
> > +             }
> > +     }
> [ ... ]
> > +     if (parent)
> > +             ret = pm_clk_add_clk(dev, parent);
> > +     if (!ret)
> > +             ret = pm_clk_add_clk(dev, clk);
> > +     if (ret)
> > +             goto fail_destroy;
> > +
> > +     return 0;
> > +
> > +fail_destroy:
> > +     pm_clk_destroy(dev);
> > +fail_put_parent:
> > +     clk_put(parent);
>
> [Severity: High]
> Will this result in a double free of the parent clock?
>
> pm_clk_destroy() destroys all clocks attached to the device, which includes
> cleanly removing the successfully added parent clock (and internally calling
> clk_put() on it). Falling through to fail_put_parent seems to call
> clk_put(parent) a second time.

True, will fix in v5.

> > +fail_put_clk:
> > +     clk_put(clk);
> > +     return ret;
> > +}

> > +static const struct power_map *fill_power_map(struct r8a78000_mdlc_priv *priv,
> > +                                           const struct power_map_in *map_in,
> > +                                           struct device_node *scmi_power_np)
> > +{
> [ ... ]
> > +             genpd = of_genpd_get_from_provider(&scmi_spec);
> > +             if (IS_ERR(genpd))
> > +                     return dev_err_cast_probe(dev, genpd,
> > +                                     "Failed to get SCMI power domain %u\n",
> > +                                     map[i].fw_id);
> > +
> > +             dev_dbg(dev, "SCMI power domain %u is %s\n", map[i].fw_id,
> > +                     genpd->name);
> > +
> > +             map[i].genpd = genpd;
> > +
> > +             /* Hook up clock domain support */
> > +             genpd->attach_dev = r8a78000_mdlc_attach_dev;
> > +             genpd->detach_dev = r8a78000_mdlc_detach_dev;
> > +             /* Setting flags this late has no impact, but does not hurt */
> > +             genpd->flags |= GENPD_FLAG_PM_CLK;
> > +             genpd->dev_ops.stop = pm_clk_suspend;
> > +             genpd->dev_ops.start = pm_clk_resume;
>
> [Severity: High]
> Is it safe to mutate the genpd struct of the SCMI provider directly?
>
> Modifying genpd->attach_dev and genpd->dev_ops here changes the behavior
> for all consumers of the shared SCMI domain. Could this cause
> cross-subsystem state corruption or spurious warnings when non-MDLC devices
> use this SCMI domain?

This should be safe on R-Car X5H:
  1. There is only a single SCMI provider,
  2. If there would be multiple SCMI providers, the safeguards in
     r8a78000_mdlc_attach_dev() would still protect against bad
     behavior,
  3. pm_clk_{resume,suspend}() are no-ops when no PM clocks were
     registered.

> > +     }
> > +
> > +     return map;
> > +}
> > +
> > +static const struct mod_map *fill_mod_map(struct r8a78000_mdlc_priv *priv,
> > +                                       const struct mod_map_in *map_in,
> > +                                       struct fwnode_handle *scmi_reset_fwnode)
> > +{
> [ ... ]
> > +             scmi_spec.args[0] = map[i].fw_id;
> > +
> > +             rstc = reset_control_get_from_provider_exclusive(&scmi_spec);
> > +             if (IS_ERR(rstc))
> > +                     return dev_err_cast_probe(dev, rstc,
> > +                                     "Failed to get SCMI reset %u\n",
> > +                                     map[i].fw_id);
> > +
> > +             map[i].rstc = rstc;
>
> [Severity: Medium]
> Does this error path leak the previously acquired exclusive reset controls?
>
> If an allocation fails mid-loop, IS_ERR(rstc) evaluates to true and the
> function immediately returns an error pointer, leaving no mechanism to free
> map entries from earlier iterations.

True, will fix in v5.

> Furthermore, the driver does not appear to iterate through this map and
> release these controls during driver unbind or teardown.

r8a78000_mdlc_driver cannot be unbound:

    platform_driver.driver.suppress_bind_attrs = true;

> >  static void r8a78000_mdlc_unlink(void *data)
> >  {
> >       struct r8a78000_mdlc_priv *priv = data;
> >
> >       scoped_guard(mutex, &r8a78000_mdlc_lock) {
> >               hlist_del(&priv->link);
> >       }
> >  }
>
> [Severity: Medium]
> Does this teardown sequence leak the priv->scmi_clk_np reference?
>
> The reference was previously acquired using scmi_find_proto() with
> SCMI_PROTOCOL_CLOCK, which returns an incremented reference count, but
> of_node_put() does not appear to be called during unbind.

The driver cannot be unbound.

> >  static int r8a78000_mdlc_probe(struct platform_device *pdev)
> >  {
> > +     struct device_node *scmi_reset_np __free(device_node) = NULL;
> > +     struct device_node *scmi_power_np __free(device_node) = NULL;
> > +     struct device_node *scmi __free(device_node) = NULL;
> [ ... ]
> > +     scmi_clk_np = scmi_find_proto(scmi, SCMI_PROTOCOL_CLOCK);
> > +     if (!scmi_clk_np) {
> > +             dev_dbg(dev, "Cannot find SCMI clock management protocol\n");
> > +             goto fallback;
> > +     }
> > +
> > +     scmi_reset_np = scmi_find_proto(scmi, SCMI_PROTOCOL_RESET);
> > +     if (!scmi_reset_np) {
> > +             dev_dbg(dev, "Cannot find SCMI reset management protocol\n");
> > +             goto fallback;
> > +     }
> > +
> > +     priv->scmi_clk_np = scmi_clk_np;
> > +     info = mdlc_data->fw_info;
> > +
> > +fallback:
>
> [Severity: Medium]
> If the jump to the fallback label occurs after successfully assigning
> scmi_clk_np (e.g., when scmi_reset_np is missing), does this leak the
> scmi_clk_np reference?
>
> Since scmi_clk_np is not annotated with __free(device_node) like
> scmi_power_np and scmi_reset_np, it requires explicit cleanup on error
> paths.

True, will fix in v5.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
