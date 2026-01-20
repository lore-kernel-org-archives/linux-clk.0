Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com [209.85.221.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68C33BF2EF
	for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 09:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768900387; cv=none; b=rPL9L7jGfS4PANnbIRbColEp98FOCV+4q1bIN3vlsgmSteMRcJBFNCN29TSlfV/qUu6pOiOx2Hufg8uGWtPGm92qnb+LNQ04DNqlCLNnQuUMuFPssQLx8qaMnMz/TwMVe9AlUgd03ftqVPsQ/dbGcsh6ir7jy4PEpPSBG9QPY+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768900387; c=relaxed/simple;
	bh=JCo/vy6Mwha6m9EVmscxyQkIBKW1GkAN6H9safd5cfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XLZ6B51FXYAB/6PDNK1+b2AUBmAeYucwHBPp6/06KKFilRGkVI+ywSasE4vHE+izpi/uB7YiJHau6ratZz/HhJhPI6zgD/KSe2k3PzrV33DQdTlCXSP5lurnvzVm8e1Dx92S0zweuVY5KzuBlPYsBgLMrQlHPjpR8INRUZL12DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f195.google.com with SMTP id 71dfb90a1353d-56367a388e5so1394062e0c.2
        for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 01:13:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768900385; x=1769505185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wC+91lBXGmHL8JSojiXe3IoVS0gwXwfT6Yt1dj4exs=;
        b=ghiaRDFkgWbrX0Lso34Gk/kNPIyNDVVNwR52ouR0nJ03oLtAxFaSTPS69vTRurYXlw
         /5tQwYjgdafK/USbtF+YnWvK0vnOMgwCcLHSD/S+7UwVTOO+wGJ1FO7cqxvt0tMvFFyC
         xZIj3Sve9AmwofoyZuvEei2dgQdtFj79tROyI67m+U6jE5g6fyZJD8S4r5MaCOxeLslQ
         CsYfYjOytbA93dtY6CbGmv8Tu1fzTUhzcq7/DmAOX0HBGGH1kPG8WCb/ALxF4oA5PRpY
         /cuoT8ouUvyCH+Qf/FSGQ/Fq5mN7pvdwK9gdlqnG9cbwaFvPbaQ3VGW992qV70DS9OGO
         zJUg==
X-Forwarded-Encrypted: i=1; AJvYcCXB9UBIC73v970iLUs7CC8I0h/oSAerVDjPhkQTp3hhGeJUX7qxWEMHhDLH64D3wnW9APonki+j7ak=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnIOrIlHF3tbIAkorc0d4WfQkXHDxdwT7itPvmFLngGdCG7Pyy
	s2aFOW20byvJuqnUrRz/M3hLwh2/8lRtcurytxNwV33RfER4GQyZ4lNr1pfCDIuM
X-Gm-Gg: AZuq6aIDXmZW+bj5SKwT/tHRtX6UQlVMENQ81TPIAkYZ3B4+aghFMlXoTR18xXriTQD
	9cOGonPXRIa7xTVVCfQ/rHA5YFZWOcLfgR7VVS/OKKaneavLarPQ/pcdDvZFhjTk1hB4iBUsTaW
	n8Nnm0Lwp2vWfGwliq/LOSUybVjEDRwZYaHNDvPtJJlqcEYz5u4p0bD5eao16ku+m/M/6RHfK7w
	DQhlWXyZm6LOlsoEQs8ZvIHx7JeCwCCSAhva7mDmxio88GwgWkWlODDMUfOmLetY4C67ArPPwYe
	5Yc7v0TmsaGNtpWih0cvN7PGBO/TQW3SVAfhyZQ+mGf1nEGy4Ak30D5grthGEyHSZ/HUy9Wdfhf
	JPIUX0e1D7Fk2duUIBBFbN0EH7H+4XZK8vpfS+p16R2NPRvZ3ll5GrruIXoRYLpXku0QZlrHzr0
	x2fP1dxskKxYmmn0FcwUhwVPJwxQ/nt3FvElnrmc+dhUoOxeNV
X-Received: by 2002:a05:6122:3c91:b0:563:746c:a32b with SMTP id 71dfb90a1353d-563b738c3d4mr3246207e0c.15.1768900384669;
        Tue, 20 Jan 2026 01:13:04 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b7124380sm3651446e0c.21.2026.01.20.01.13.04
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 01:13:04 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-93f6bd3a8f4so1578435241.3
        for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 01:13:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVg2vCPZeoGuNaMLCqIbc7edOdGXDLdHfQESfqFlPDdABbo0UE2Ezi2fh3+SlretNvP+CeQBa0Veug=@vger.kernel.org
X-Received: by 2002:a05:6102:134f:b0:5ec:c528:4df0 with SMTP id
 ada2fe7eead31-5f1a71a7154mr3003863137.34.1768900384198; Tue, 20 Jan 2026
 01:13:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a6dce17b15d29a257d09fe0edc199a14c297f1a8.1768836042.git.geert+renesas@glider.be>
 <d921ff48-caa3-4d79-80e8-35c4848258da@mailbox.org>
In-Reply-To: <d921ff48-caa3-4d79-80e8-35c4848258da@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jan 2026 10:12:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWfEHcNwPCVPXeAO3Sk8U=p0nMVUksiwmMnnkf0LYmnjg@mail.gmail.com>
X-Gm-Features: AZwV_Qj9V8xzMgGDE9Ei_APB41OLIDWWyCZ0s_oMJRaqKrdIGg3tj-xH88Zkkk0
Message-ID: <CAMuHMdWfEHcNwPCVPXeAO3Sk8U=p0nMVUksiwmMnnkf0LYmnjg@mail.gmail.com>
Subject: Re: [PATCH] clk: rs9: Convert to clk_hw_onecell_data and of_clk_hw_onecell_get()
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 19 Jan 2026 at 20:36, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 1/19/26 4:23 PM, Geert Uytterhoeven wrote:
> > rs9_of_clk_get() does not validate the clock index in the passed
> > DT clock specifier.  If DT specifies an incorrect and out-of-range
> > index, this may access memory beyond the end of the fixed-size clk_dif[]
> > array.
> >
> > Instead of fixing this by adding a range check to rs9_of_clk_get(),
> > convert the driver to use the of_clk_hw_onecell_get() helper, which
> > already contains such a check.  Embedding a clk_hw_onecell_data
> > structure in the rs9_driver_data structure has the added benefit that
> > the clock array always has the correct size, and thus can no longer
> > become out of sync when adding support for new rs9 variants.
> >
> > Fixes: 892e0ddea1aa6f70 ("clk: rs9: Add Renesas 9-series PCIe clock generator driver")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > While this patch applies on top of "[PATCH v2] clk: rs9: Reserve 8
> > struct clk_hw slots for for 9FGV0841", it can be applied or backported
> > without, by ignoring the change from "clk_dif[4]" to "clk_dif[8]".
>
> Since the 9FGV0841 is the biggest part in the 9FGV series, the one-liner
> fix I posted is better suited as a stable backport. This rework
> shouldn't have the Fixes tag, since it is only that, a rework.

This is not just a rework, as it also fixes a second issue.
But since you prefer simpler fixes, I have submitted a v2 that just
adds the missing range check[2].  We can revisit the conversion to
of_clk_hw_onecell_get() later, after all fixes have landed.

> With that fixed:
>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks!

[2] "[PATCH] clk: rs9: Add clock index range check to rs9_of_clk_get()"
    https://lore.kernel.org/all/4cb63bd8b1e49407831431fbc88b218f720a74fd.1768899891.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
