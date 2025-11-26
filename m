Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC9B1FC7C5;
	Wed, 26 Nov 2025 15:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764172023; cv=none; b=o1MD8ap+6XfqVlywQVr4sNh24WcezLt1tN3wUi0wBPqBkvY2nRlpKZqYUKsOLIhypEAV0yYivjfeHRjy+dMlMNPkUQ3ukbutIAOloCKdrihNH7O7+icjbDPL1s6frQHRNBUjJ6sRuiT941OaE3u9Qz3TJNJgm0eVJ/vgnXNI8X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764172023; c=relaxed/simple;
	bh=l+5MsesiWzmet9GRAET1gD8eIgf+wj+88gEkEndlf5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IEQiw6lyCxSyPtM5HZNhpSLsomcyvrve9QahqQ0+KY5LD0xvJ7tGnLLTSb3O2l+jHbV91uMusYrdk7kOXX9GgqV1HUC+3jFkh/Zva8sicbblqGAs+w4ICOkaevp15dCm0ivSP7fRpKetPTQvj3lMjoO6LludAvmc199FZF18AWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cvhk6bj+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cvhk6bj+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B84C113D0;
	Wed, 26 Nov 2025 15:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764172023;
	bh=l+5MsesiWzmet9GRAET1gD8eIgf+wj+88gEkEndlf5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cvhk6bj+MDcR6W/eD8WfO2WDZ8NYTQz5dCm0AFofoQa+fCNbpdiR9JdS+hOTbclCS
	 4oKv5Bvgk763y90ExsiNqDprFCYXJAeZL2B/69gixaYKptMXgKxd2MI5MxTFcoxmvL
	 E+v/UsFEDtxl5eRYWVQqUyie8k0DmOWFwpA3BdKVrXxgE3ss7K5x2iX+2NLjZWaPdv
	 fSvu1nToYH7GDsZ4FaSQShw5CSDgdSC1cIDTlzLPORzI189J7BvXhKqUUCYIpSNH8P
	 AfDSMUHCMW2b9qZb+wOtpeSj5h3pkhvugqnKv5cbGlEpV43G+MNGMHW1mAEfMD8gH3
	 4ttT7ju9BE2JQ==
Date: Wed, 26 Nov 2025 09:46:58 -0600
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>
Subject: Re: [PATCH 4/7] clk: thead: th1520-ap: Support setting PLL rates
Message-ID: <aScg8oH3I8wJvFHs@gen8>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-5-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120131416.26236-5-ziyao@disroot.org>

On Thu, Nov 20, 2025 at 01:14:13PM +0000, Yao Zi wrote:
> TH1520 ships several PLLs that could operate in either integer or
> fractional mode. However, the TRM only lists a few configuration whose
> stability is considered guaranteed.
> 
> Add a table-lookup rate determination logic to support PLL rate setting,
> and fill up frequency-configuration tables for AP-subsystem PLLs.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 142 ++++++++++++++++++++++++++++++
>  1 file changed, 142 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>
