Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD65C2BE630;
	Wed, 25 Mar 2026 02:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774406956; cv=none; b=LaftoOcr3p0mkvhrTlLqjnjW21YSWr+lG89+azVTtHGBJxVgWW1mUVHDBqiUKUFn5BezQ6cXJNK6X/x5Rrw5vycQ2SeHNl+Ie42OgC0z2JyMAyYXxNfMAI/CBoEldDAADOg+S0JqUePrSFzFU3e7ifOjP934ijDWE8tDSMROcn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774406956; c=relaxed/simple;
	bh=NwmYQBLz7JcE8+7D2j10LQ/+qqEA+aOzxOhRXdHvrYs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=dpsrd191+OXKvckilLuj8CDg+/VUkAOGCBhjy1dNfbaZ+yD8hG9clrY9DEyIASe/UGYH89Spz26YOD3Y3IjetmYf86KZIyFccpYu9LKgbbGyWAYVGSu0TqZpv6mxWqS7LhlhJIVW6rN67R9OjPAgYovNPW9zpa34AYFOolWjgVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HrgcPBJH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HrgcPBJH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729A1C2BCB2;
	Wed, 25 Mar 2026 02:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774406956;
	bh=NwmYQBLz7JcE8+7D2j10LQ/+qqEA+aOzxOhRXdHvrYs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HrgcPBJHECEHIBCxtFjw6LNjQqZODh4byFrwbgs3CyBnSVM/f17QjWCN4fgf8osm2
	 1i2eDoqdfb27//JxvgdxQklpekeSaMDwF42bEpPqSWxUatAfxRCv69g3k1Tnk2Wvpe
	 Zt+uJvEF4ESG+9B29sKmCid4hM/y1MzKDO52xUWJCyd6D2JJPSOV//Q/QD7G6/KVPr
	 JnHYUm5Nqk5Q3NaQOvC9GZ2SmPjMI1GOvG5LG0MVpTReMxoNCgjbtu5ErH7QodBJGU
	 VnpUrmls+iK2VZfS4kwN5AvMEdsTC715LmZCF643j6uDcGgeL+z6hlTx/xdJmTB/Bx
	 DjWih36jegv2A==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260304-clk-docs-v1-1-fee468db99f1@redhat.com>
References: <20260304-clk-docs-v1-0-fee468db99f1@redhat.com> <20260304-clk-docs-v1-1-fee468db99f1@redhat.com>
Subject: Re: [PATCH 1/2] clk: add kernel docs for struct clk_core
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Brian Masney <bmasney@redhat.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 24 Mar 2026 19:31:03 -0700
Message-ID: <177440586383.5403.6563786360526680278@localhost.localdomain>
User-Agent: alot/0.12

Quoting Brian Masney (2026-03-04 14:51:03)
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 47093cda9df32223c1120c3710261296027c4cd3..18b7a14e3f2c595d82401be93=
82a062fbca8a5c6 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -63,6 +63,65 @@ struct clk_parent_map {
>         int                     index;
>  };
> =20
> +/**
> + * struct clk_core - This structure represents the internal state of a c=
lk
> + * within the kernel's clock tree. Drivers do not interact with this str=
ucture
> + * directly. The clk_core is manipulated by the framework to manage clock
> + * operations, parent/child relationships, rate, and other properties.

Trim this down and use active voice please.

 /**
  * struct clk_core - The internal state of a clk in the clk tree.
  *
  * Managed by the clk framework. Clk providers and consumers do not
  * interact with this structure directly. Instead, clk operations flow
  * through the framework and the framework manipulates this structure
  * to keep track of parent/child relationships, rate, enable state,
  * etc.
  *

Does the longer paragraph description follow directly after the one line
short description? Or does it come after all the members?

> + *
> + * @name:              Unique name of the clk for identification.
> + * @ops:               Pointer to hardware-specific operations for this =
clk.
> + * @hw:                Pointer for traversing from a struct clk to its
> + *                     corresponding hardware-specific structure.
> + * @owner:             Kernel module owning this clk (for reference coun=
ting).
> + * @dev:               Device associated with this clk (optional)
> + * @rpm_node:          Node for runtime power management list management.
> + * @of_node:           Device tree node associated with this clk (if app=
licable)
> + * @parent:            Pointer to the current parent in the clock tree.
> + * @parents:           Array of possible parents (for muxes/selectable p=
arents).
> + * @num_parents:       Number of possible parents

Add a period.

> + * @new_parent_index:  Index of the new parent during parent change. Thi=
s is
> + *                     also used when a clk's rate is changed.

Not sure we need to get into the details here. Maybe 'Index of the new
parent during parent change operations'

> + * @rate:              Current clock rate (Hz). This is effectively a ca=
ched

Sorta same comment. Not sure we should do anything besides say this is
the cached clk rate in Hz. Maybe we need a better top-level comment
indicating how rates are cached instead and how the framework uses flags
to change the behavior.

> + *                     value of what the hardware has been programmed wi=
th. It's
> + *                     initialized by reading the value at boot time, an=
d will
> + *                     be updated every time an operation affects the ra=
te.
> + *                     Clocks with the CLK_GET_RATE_NOCACHE flag should =
not use
> + *                     this value, as its rate is expected to change beh=
ind the
> + *                     kernel's back (because the firmware might change =
it, for
> + *                     example). Also, if the clock is orphan, it's set =
to 0

is an orphan

> + *                     and updated when (and if) its parent is later loa=
ded, so

later registered

> + *                     its content is only ever valid if clk_core->orpha=
n is
> + *                     false.
> + * @req_rate:          The last rate requested by a call to clk_set_rate=
. It's

Use clk_set_rate() to indicate a function.

> + *                     initialized to clk_core->rate. It's also updated =
to
> + *                     clk_core->rate every time the clock is reparented=
, and
> + *                     when we're doing the orphan -> !orphan transition.
> + * @new_rate:          New rate to be set during a rate change operation.
> + * @new_parent:        Pointer to new parent during parent change. This =
is also
> + *                     used when a clk's rate is changed.
> + * @new_child:         Pointer to new child during reparenting. This is =
also
> + *                     used when a clk's rate is changed.
> + * @flags:             Clock property and capability flags.

Can we somehow link this to the CLK_* defines in clk-provider.h?

> + * @orphan:            True if this clk is currently orphaned.
> + * @rpm_enabled:       True if runtime power management is enabled for t=
his clk.
> + * @enable_count:      Reference count of enables.
> + * @prepare_count:     Reference count of prepares.
> + * @protect_count:     Protection reference count against disable.
> + * @min_rate:          Minimum supported clock rate (Hz).
> + * @max_rate:          Maximum supported clock rate (Hz).
> + * @accuracy:          Accuracy of the clock rate (parts per billion).
> + * @phase:             Current phase (degrees).
> + * @duty:              Current duty cycle configuration (as ratio: num/d=
en).
> + * @children:          All of the children of this clk.
> + * @child_node:        Node for linking as a child in the parent's list.
> + * @hashtable_node:    Node for hash table that allows fast clock lookup=
 by name.

fast clk lookup

> + * @clks:              All of the clk consumers registered.
> + * @notifier_count:    Number of notifiers registered for this clk.
> + * @dentry:            DebugFS entry for this clk.
> + * @debug_node:        DebugFS node for this clk.
> + * @ref:               Reference count for structure lifetime management.
