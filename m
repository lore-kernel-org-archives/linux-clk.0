Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7350A28D8FD
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 23:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771369972; cv=pass; b=Y8gh+sbTPgTjWBcmUYhu1CzCrDj+nmwSF54KYVdV3a2sDEz/3F8SjAh1bsmPiXPpHl3locw7fdv3agJWVskTVLfryZO0ENVoLeIhTcJJCXuthxOp/QKdEQYvT+uVMY1ZeKhWtTC5OXu9Jr+7Pr4QeZQUWjUeUk6QlM1rPImXF1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771369972; c=relaxed/simple;
	bh=TFhE/3nm/eNuFUAsYaPzWXKDQdMXz6mmhFERgmch1Co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jpKwqCELogEuIJJ32wo2TIs3hJC31sxvzjHqZN3y2sd2oVu6AU0KXXV5op3qcOE7oR8qip2aKmrgCz9RxiS2orNOo6NxGO2QmTYO/vAD1xmblQgcFa0mWKV/hooBVt0V1zDBoqBUHu+wE/N5FOJlgcms5b9Ew/kavXA+5vO+bd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=eBOtkI5N; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="eBOtkI5N"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7947cf097c1so37218117b3.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 15:12:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771369969; cv=none;
        d=google.com; s=arc-20240605;
        b=Y2/HKnddhBWLhX7Fl70B9jnsh1NZd66Pce/+vSCqeGM7U1MtGGqdqrpkyteHTd9rYx
         uwyC1YkW4C4IDC865mSd6bLugwg+6WymwLdsmzaWTyKX3Pkk8NMPXY+DUsZ66KAnjLfQ
         +vbwpizQr+K5c7d9ixr4nq7bj5UsPqfbTrJv6Gxx9EnuGYyja+a/MlL4rqVtYcGHqsk9
         8JqYCpfJdCMZwHzXlVZetTdSWE2iyG6aN6ixfQaseKTLsGFJvPATmHFw+wFxJo00J4rl
         bq5Zx3tJ1VUNTOhJ1LfLJjcPCP6xRtwnRGDu+gwpn5TpXd8xMqPlhI4KVHd6fo9ZZr+O
         0HPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zP/wT+ORYJYEWXPTfGliwdU0mYdU90fsImuNVpM/pjY=;
        fh=qrKuyz09E2hEjNzCGI3uPVMvIPaz0Y17yEqpbAzStmg=;
        b=SCbJcoup9wtdqANOiK+AzdSF1tSfZjZPAwVZAc06gzArsq2bhWx6WNfGUThwoZo8I0
         b/q99U55sBogl1/X9/m/owd7JnlCjrV0Mh+HJsjgPDX5IugN/eHYO583dM3yb40ai/C7
         r7PsoangrfzvKI6ZXtAXnSqGZ1T58zu7YstkI063pmos5sfch2C9ELaojynu2mjqTumd
         ABe4Vr5JtM16LW9JBcadji3aRpyG/SBiQUfWbJUPwUuAbRrTAAORSbsPk47kmL9ZmoXt
         4jTGUvMCx4G51KSQfrUahlxp6dFNb7fc9qeb0NJikActct3A2RdTWWffl8m+cgkA4WHi
         7v5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1771369969; x=1771974769; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zP/wT+ORYJYEWXPTfGliwdU0mYdU90fsImuNVpM/pjY=;
        b=eBOtkI5NwGtuPM0kfDxh8ugWBSs2gLKi3k1y2kgGsbl/cVJVr2ELxRWkV0RGfA6ssw
         3bgYYVbukRhhY+aSzyWD2d473gCJMEe965cBU4CJFP/1hx2Fm+S9aOUxX2/+1556LFPC
         dAf5KIgnf+Iib58tDBMgw4fmwhmyn6lYxNERbaMJxnfXkR4jm1FipQeOO6Th1r3todYU
         RYwLwAEwMQPXLwD7xttzDP+OkRQVXE9/JbagcukcuFbqRgdrSnR8/NynznrKz0TGTj9K
         a4KGgsqAMW/c7l4WvPFgpZAy/aph+ezx0kat3b+XNcN6L/+gLdErIpfA0s4Id+9xT1Ym
         mRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771369969; x=1771974769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zP/wT+ORYJYEWXPTfGliwdU0mYdU90fsImuNVpM/pjY=;
        b=CA3DL0q+szwRjz8VSkpl6PENtbX8K0AuBUyZeWm0UFxESWEJ+dsgPDh8rBMP+DFvcK
         aViEeGUpwC3gdpizlzpvk3bkQIX76VgNqlkhsf0Sgnpm8lB0eSmZgqqe2RIQx9Zjs8SF
         dQVWsG+MT+gXsMttWPJi3Mtp7xgcRw9YZs8Deb/wej4PrIns1CzrEQwspoibQ+DyLyGr
         4pB3wzTMj5hvUvyqRvpgnWXnvZ71VJkYfBDaGe31+6pKk9M4UIUEvNzzdSI6wyLIWqTq
         n6hM5k3dD3nDIberytKnEOovm125rviWc5vN35C8OutYFYkcilQzLtok5TeORLE1D8lz
         W3oA==
X-Forwarded-Encrypted: i=1; AJvYcCWD3IRn8TzVt0Yg+QRA3ckfRuC6HOtKnfLkCN5rAa/53LbL+of6CjpWSWPnIOLBWK+1MSTkuqMCVTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHfTgVWIyJgdBSULLINQb04gI8dyNY70EuBqWMllSCOEtw7onL
	tVBfoWqyS0VEEJ+20yKVx477xTiP/ENg9KRKC+dWpSEzbea0nSYQwTKrPOyplVu1p66ku6ZoTAF
	mk+5cy3xXQX/j47oV1qKZ7n8lrNbU4eWTTXItckE5kg==
X-Gm-Gg: AZuq6aJmJtyNutY4QzQ0nUP8H1873Xoq0kxk3ZCYVycTYFYW6hrWUtOWl0NGXrQha/+
	U614F5Vsk2lHrHQ9RaaG5Iw9069cRP+9cJ0jiptTDSQY48m16CTq6gBeIqtgujh/C9LdNcizMjr
	+qRQZY/8njFbeS1WRsx7UZw/rxFYVA7kuIrXCZEgxgTH7kp79wGqfvOCIzwkRDswDlV7ta1Rbs/
	+oUaAQWrLVKxJOBqxEc2gFdyj1WgNrfv9P9s4x/tnke6cHj2HF6KUPWaXjDatA7D7Heu8hXe9Ig
	NMmhvKm583aV1RQQwtrM/oHTZGtIAA2ltGcR40J1zCxGPKSRnFKNOjfCTW/tb65CweZnBjO9
X-Received: by 2002:a05:690c:dd4:b0:794:77da:aa40 with SMTP id
 00721157ae682-797ac5cdf09mr105123407b3.43.1771369969517; Tue, 17 Feb 2026
 15:12:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com>
 <20260216-atlantis-clocks-v6-3-cb46d6a59c73@oss.tenstorrent.com> <aZST4Yywv09u65MP@redhat.com>
In-Reply-To: <aZST4Yywv09u65MP@redhat.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 17 Feb 2026 17:12:38 -0600
X-Gm-Features: AaiRm53ZgMX5zL3OnOXtCGVJ3U5aMlR3Ss87ookwvkWmf5kHgzV6nQtkNYJPn7M
Message-ID: <CAEev2e_XjxD3kHbOxVYwbf0Q0cwEr96dSQ3hWZE9eLdgeXhs4g@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] clk: tenstorrent: Add Atlantis clock controller driver
To: Brian Masney <bmasney@redhat.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Brian

On Tue, Feb 17, 2026 at 10:14=E2=80=AFAM Brian Masney <bmasney@redhat.com> =
wrote:
>
> Hi Anirudh,
>
> On Mon, Feb 16, 2026 at 04:16:34PM -0600, Anirudh Srinivasan wrote:
> > Add driver for clock controller in Tenstorrent Atlantis SoC. This versi=
on
> > of the driver coves clocks from RCPU syscon.
>
> ...covers clocks..

Thank you for your comments. I will address the typos and add the
static modifier for the different variables that you suggested.

> > +
> > +struct atlantis_clk_gate_shared_config {
> > +     u32 reg_offset;
> > +     u32 enable;
> > +     unsigned int *share_count;
>
> Why is this a pointer? Could this just be a plain unsigned int since
> all occurrences of this are dereferenced?

We have a group of gate clocks that have a single enable bit shared
among them (instead of individual enable bits for each clock). We need
to keep track of the number of clocks within a group that have
requested an enable, and only unset the bit if all the clocks are
disabled. share_count is used to keep track of this. It gets updated
by each clock. Hence it's a pointer (and the mutexes around access to
it).

> > +static int atlantis_clk_gate_is_enabled(struct clk_hw *hw)
> > +{
> > +     struct atlantis_clk_gate *gate =3D hw_to_atlantis_clk_gate(hw);
> > +     u32 val;
> > +
> > +     regmap_read(gate->common.regmap, gate->config.reg_offset, &val);
> > +
> > +     val &=3D gate->config.enable;
> > +
> > +     return val ? 1 : 0;
>
> What do you think about this instead?
>
>     return !!val;

Ack

> > +static int atlantis_clk_gate_shared_enable(struct clk_hw *hw)
> > +{
> > +     struct atlantis_clk_gate_shared *gate =3D
> > +             hw_to_atlantis_clk_gate_shared(hw);
> > +     bool need_enable;
> > +     u32 reg;
> > +
> > +     scoped_guard(spinlock_irqsave, gate->config.refcount_lock)
> > +     {
> > +             need_enable =3D (*gate->config.share_count)++ =3D=3D 0;
> > +             if (need_enable) {
> > +                     regmap_read(gate->common.regmap,
> > +                                 gate->config.reg_offset, &reg);
> > +                     reg |=3D gate->config.enable;
> > +                     regmap_write(gate->common.regmap,
> > +                                  gate->config.reg_offset, reg);
> > +             }
> > +     }
> > +
> > +     if (need_enable) {
> > +             regmap_read(gate->common.regmap, gate->config.reg_offset,=
 &reg);
> > +
> > +             if (!(reg & gate->config.enable)) {
> > +                     pr_warn("%s: gate enable %d failed to enable\n",
> > +                             clk_hw_get_name(hw), gate->config.enable)=
;
> > +                     return -EIO;
> > +             }
> > +     }
>
> Should this check be done within the scoped_guard?

The lock is used only for access to *gate->config.share_count. Since
we aren't reading that here, it isn't put inside the lock.

> > +static int atlantis_prcm_clocks_register(struct device *dev,
> > +                                      struct regmap *regmap,
> > +                                      const struct atlantis_prcm_data =
*data)
> > +{
> > +     struct clk_hw_onecell_data *clk_data;
> > +     int i, ret;
> > +     size_t num_clks =3D data->num;
> > +
> > +     clk_data =3D devm_kzalloc(dev, struct_size(clk_data, hws, data->n=
um),
> > +                             GFP_KERNEL);
> > +     if (!clk_data)
> > +             return -ENOMEM;
> > +
> > +     for (i =3D 0; i < data->num; i++) {
> > +             struct clk_hw *hw =3D data->hws[i];
> > +             const char *name =3D hw->init->name;
> > +             struct atlantis_clk_common *common =3D
> > +                     hw_to_atlantis_clk_common(hw);
>
> You can join these two lines into one and you'll be at 83 characters.
> checkpatch.pl now allows up to 100.

>
> > +             common->regmap =3D regmap;
> > +
> > +             ret =3D devm_clk_hw_register(dev, hw);
> > +
> > +             if (ret) {
> > +                     dev_err(dev, "Cannot register clock %d - %s\n", i=
,
> > +                             name);
>
> This will be at 81 characters if the lines are joined.

I used clang-format to do the formatting here and it seems to have
picked a line length of 80? I can change this

>
> However, bigger question is if this message should be dropped entirely? I=
f
> this condition occurs, an error is logged here, and a second message will=
 be
> logged in atlantis_prcm_probe() below.
>
> > +                     return ret;
> > +             }
> > +
> > +             clk_data->hws[common->clkid] =3D hw;
> > +     }
> > +
> > +     clk_data->num =3D num_clks;
> > +
> > +     ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, c=
lk_data);
> > +     if (ret)
> > +             dev_err(dev, "failed to add clock hardware provider (%d)\=
n",
> > +                     ret);
>
> Should this message also be dropped as well?

So you're suggesting that we just print a single error message instead
of multiple. I can change it to be like that.

>
> Brian
>
