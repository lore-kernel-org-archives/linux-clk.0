Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A32C37CD53;
	Tue, 12 May 2026 21:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778620932; cv=none; b=IozdMKCGrOdWq1VGFE9bf38zg6Ca4WSANohBIcOa9gdO8K7K2WV7B78NwuzYV8eFsPBdMcB8Xy88NIjDOUgmpf/LktbJ9u3axBSbjwUJZA5vn0sEeZ+G+5+o5g3VZQtchwehPjBpSk46JiwmVdWDnUhO698MiNfzwT2oOZ+D8Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778620932; c=relaxed/simple;
	bh=/QWCSDlBWloO8pk4jawn5DR5zzoVvNAzavKhdi46lzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gWZzpN4HBItOD+tjXOrstEBgIJwOc07CfNYs83dm0YPLSabATVXvFQK/QFksQ/Bjqx7kEURpve647TwwJWiAXhpZmRTpgJw9yZ3K6k2N0JLvQFnXwCMPprxRKbGgkgsm+b2Y5/u4uVCZltiFkCaFLV2ljzWWpCrJkGd5izPTbyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uSDrAadh; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uSDrAadh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=vGAbI1dsecscVoqVx1Gl2ix9ljJK1LtPHCGPyKtd8Og=; b=uSDrAadhFyzRpG/IM3C5HrF5vT
	Ns2olnVvhSHTKShtzXKdXRvLDzylzhD+GzD/oyaxF4D0PrLWIIqhNzzrExWzZf/yumcCENcoTxVYf
	N3hRtXW+s3JKJTmDQR2JMYnzZ/UH75UlY42Wfs/3DURMd9UP+764zzK0DaqrPz2Jx/8jRUtdolAHM
	D2wsGWD0+0RljjIMR/4kcnpGE0R9JbntH73uvr16XGZDblrgZN4/0WxlwredE1gg+C95lMwM58bVL
	Xmabj3e+XTzcrEu7NurW0WJVRzrehwcxV+RgxxBuH2NShrRP6kDStx/4py4uicNBF4xBoC4vA/P2j
	QYYiBZrQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMuYK-00000000TU2-1KSg;
	Tue, 12 May 2026 21:22:08 +0000
Message-ID: <1322f23c-239c-4b36-93cd-fd8fd142dd16@infradead.org>
Date: Tue, 12 May 2026 14:22:07 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: add kernel docs for struct clk_core
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260511-clk-docs-v3-0-ed67e1065809@redhat.com>
 <20260511-clk-docs-v3-2-ed67e1065809@redhat.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260511-clk-docs-v3-2-ed67e1065809@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/11/26 6:35 PM, Brian Masney wrote:
> Document all of the members of struct clk_core.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/clk/clk.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 048adfa86a5d..0b519d95bbcb 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -63,6 +63,57 @@ struct clk_parent_map {
>  	int			index;
>  };
>  
> +/**
> + * struct clk_core - The internal state of a clk in the clk tree.
> + * @name:              Unique name of the clk for identification.
> + * @ops:               Pointer to hardware-specific operations for this clk.
> + * @hw:                Pointer for traversing from a struct clk to its
> + *                     corresponding hardware-specific structure.
> + * @owner:             Kernel module owning this clk (for reference counting).
> + * @dev:               Device associated with this clk (optional)
> + * @rpm_node:          Node for runtime power management list management.
> + * @of_node:           Device tree node associated with this clk (if applicable)
> + * @parent:            Pointer to the current parent in the clock tree.
> + * @parents:           Array of possible parents (for muxes/selectable parents).
> + * @num_parents:       Number of possible parents.
> + * @new_parent_index:  Index of the new parent during parent change operations.
> + * @rate:              Current cached clock rate (Hz).
> + * @req_rate:          The last rate requested by a call to clk_set_rate(). It's
> + *                     initialized to clk_core->rate. It's also updated to
> + *                     clk_core->rate every time the clock is reparented, and
> + *                     when we're doing the orphan -> !orphan transition.
> + * @new_rate:          New rate to be set during a rate change operation.
> + * @new_parent:        Pointer to new parent during parent change. This is also
> + *                     used when a clk's rate is changed.
> + * @new_child:         Pointer to new child during reparenting. This is also
> + *                     used when a clk's rate is changed.
> + * @flags:             Clock property and capability flags. See
> + *                     `clk framework flags`.
> + * @orphan:            True if this clk is currently orphaned.
> + * @rpm_enabled:       True if runtime power management is enabled for this clk.
> + * @enable_count:      Reference count of enables.
> + * @prepare_count:     Reference count of prepares.
> + * @protect_count:     Protection reference count against disable.
> + * @min_rate:          Minimum supported clock rate (Hz).
> + * @max_rate:          Maximum supported clock rate (Hz).
> + * @accuracy:          Accuracy of the clock rate (parts per billion).
> + * @phase:             Current phase (degrees).
> + * @duty:              Current duty cycle configuration (as ratio: num/den).
> + * @children:          All of the children of this clk.
> + * @child_node:        Node for linking as a child in the parent's list.
> + * @hashtable_node:    Node for hash table that allows fast clk lookup by name.
> + * @clks:              All of the clk consumers registered.
> + * @notifier_count:    Number of notifiers registered for this clk.
> + * @dentry:            DebugFS entry for this clk.
> + * @debug_node:        DebugFS node for this clk.
> + * @ref:               Reference count for structure lifetime management.
> + *
> + * Managed by the clk framework. Clk providers and consumers do not interact
> + * with this structure directly. Instead, clk operations flow through the
> + * framework and the framework manipulates this structure to keep track of
> + * parent/child relationships, rate, enable state, etc.
> + *
> + */
>  struct clk_core {
>  	const char		*name;
>  	const struct clk_ops	*ops;
> 

-- 
~Randy
