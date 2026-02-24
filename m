Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C477A2DC35C
	for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 08:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771922911; cv=none; b=DGaUWkLoJa38wSFkx9m4ka9kcjU9Pch7qcFG6G3fhbQrM/Z7g9hTHPKXRTN2Ge7uE62XqcSdyWWa8Xko9pH+wj+prsWc3HkKT22hG+T+BvGpGglzw6Qg5Z9zNxn24MDxuCXa+oauQzfnAyQnNV1+q3pHceaAwmolM+WO4/o/qYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771922911; c=relaxed/simple;
	bh=WZudfqDLDhlSb65CicFgbRC5ndGFiTlzwfsufrRPCAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2ydVINMwZnE350UvndjDW/l2KQ1auO0Qt3JjBTBU1ms2TkNl2wH6/G0h5KZED+POh0XelTxvyk4rXXfepJW3dQ2B3A3LO5s+/cD+YYJVXFQe+i27CbWuSdWXdjz4mKFoLkXh5mR8qdCWc6LDYnGoOxdAzx6bYK8doeQWnLZUzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgxJU7p0; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgxJU7p0"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cb48234b08so557400185a.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 00:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771922909; x=1772527709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wLIr4Pcgj/NXXvWMRAkKAWUcHGLbiCbZ9DDq0B2UnF4=;
        b=hgxJU7p04KxbPl064ah14uwkFdlAUi+mXJtlVCg7NznI5xxdHyjpJvbvB6fMExkJP7
         RFKw40hfnkt+gdASXD6oIsoOTm/+qmfXk3bHGsQjAuALOKuL4843S7p9SSq5wRc/LBwF
         nztxdXI5qPUZDBQoJNJFix76LGktg2CSX84QuGWmrqDdxMdo6334IlovJPPUivOy6kae
         EOVItwhwNqjDHtBOn20ME6nH1vEj/5fUPyGaqzL9egtQx6rGvoCdgi2Ypj9pnUY7ynGX
         O4t7b2MNVgfxIovRe+IC/olR2YcRpLxEAKBE32ZOVN3guzeX+KMZxOWYfabqwH4UWl3s
         7+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771922909; x=1772527709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLIr4Pcgj/NXXvWMRAkKAWUcHGLbiCbZ9DDq0B2UnF4=;
        b=oe62+RaSC0a9thPxYXp5S2bVrpuBneQuJsBI31iwmd4by5kFpMdtG/AlHYzBzVTNUr
         drjMOHWM0WzSWiW9KS5tcVPYZCl2wY1hfSH6hAzUZcoij/w49t0nQLyw3+7KwkL9afS5
         5cX1mV+wBxmmGhltH/Bh1uaNKR3K5EZPYGENE6mglTMAIFGNBhYytrZUtiL02ihKLbbS
         pKQKI0P+97nMNsq5buQPFQhD6f34RXl3tzBnQ3h0Tnznwxw/DkQag4V6//UHLBKl0i+J
         5a9R07J6yyxnpNyKXSYf4cUhD9wZfqoe7d8j/yuVgtcf5EAtb0WVE9xVqFoAdQIImNxS
         76Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXmdzz22sTthd8du8Nqf3IOBLbn4VwVO10/f/8hoLCvELJbZmmDiOWl1GVXouEEneX1zz+rkJjaHZU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy53vRKl23wQ8LykL+mHzLzwdeYZmFfHbkAKdPaLlF9gMOfKqWA
	+Yrm0IUz+0eULvlguUF7uN3c5DYf3Z89SfScz3uKq4C56H1IaYo8LFpW
X-Gm-Gg: ATEYQzzfbftoZX4Xp4Ixv6z0ib1txLUzuygpSBcknIi7J3CNDgMCXX8WGoZWzlbCMwg
	JtOmnvV6ToKLNYi/rPTeDqdsUc3ySQrqmZflWj9IJhwiBJcDBrkx0KWSY0sKUkP6ITNDRF41nG8
	Ui1FYsGgqBMignMW1ge/Mqpw/pL6EBWh+TIWnzjzUov36Fa97KNxjuzKZU5CozOTuGyOWbwCEpU
	RvuFl+JF6baltp3yZBNOSl6h0cKwT/1ik0GL5EDoBN5VAfIColCHz9/w444VDtjkTsd/YQb/LWg
	T2+XeCYT4016sk1x24MY0AGw0JuQnDahfOmZC4mNXttZShw0xYvNMEoum2ZFvv6EAWj1OYmGygI
	9vdHNw1SgkUI06FEw/5wma+TNd3X25EhKR0tcJ3fRjGs/jVb4Qm2ed81eqfpQxSwM1oLTF3ZWfw
	5xt3+d+GcQ7xAcptOZaqw9ikFs
X-Received: by 2002:a05:6214:21ea:b0:894:2f5b:fb98 with SMTP id 6a1803df08f44-89979d4cfa6mr151391526d6.38.1771922908619;
        Tue, 24 Feb 2026 00:48:28 -0800 (PST)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997c6bc975sm91348266d6.19.2026.02.24.00.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 00:48:27 -0800 (PST)
Message-ID: <ae2358d7-7e82-49fe-8a03-195487a7b010@gmail.com>
Date: Tue, 24 Feb 2026 00:46:13 -0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 0/3] Add driver support for ESWIN eic700 SoC clock
 controller
To: dongxuyang@eswincomputing.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, troy.mitchell@linux.dev, bmasney@redhat.com
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com,
 marcel@ziswiler.com
References: <20260214101421.228-1-dongxuyang@eswincomputing.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260214101421.228-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi ESWIN folks,

I'm testing your patchset on
https://github.com/ganboing/linux-eic77/tree/eic77-integration-test-clk-v13

It's applied on top of Samuel's PMA v3 patshset, plus device-tree patches
from your integration test branch. It's pretty similar to what Marcel did,
but I just want to have a separate verification. What I found is that the
kernel can successfully boot with clk_ignore_unused (eMMC/eth working),
but hangs without. It stuck at

[    3.257141] clk: Disabling unused clocks

I'm pretty sure that some clocks that weren't supposed to get disabled got
turned off. Can you validate if that's a bug in the clock driver, or my
device-tree just didn't link all clocks. One thing I noticed is that there
is no CLK_IS_CRITICAL in your code, so it's highly likely that DDR PLL or
others were turned off unintentionally. Not a clock driver expert, but I'd
expect the kernel should work fine without clk_ignore_unused.

Bo


On 2/14/26 02:14, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
> 
> The link [1] provides the official documentation for the EIC7700. Section 3.2
> covers the clock subsystem.
> 
> [1] https://www.sifive.com/document-file/eic7700x-datasheet
> 
> Updates:
>    Change in v13:
>    - Updated driver file
>      - Modify commit subject from "clock: eswin: Add eic7700 clock driver"
>        to "clk: eswin: Add eic7700 clock driver".
>      - Use parent rate to calculate PLL clock rate.
>      - Use GENMASK() to define PLL mask macros and use FIELD_PREP() to simplify
>        bitwise operations.
>      - Remove shift and width references for pll enable, refdiv, fbdiv, frac and postdiv.
>        (Use only the PLL macros to match the functionality)
>      - Set postdiv1 and postdiv2 in clk_pll_set_rate function.
> 
>    - Link to v11: https://lore.kernel.org/all/20260213094112.115-1-dongxuyang@eswincomputing.com/
> 
>    Change in v12:
>    - Updated driver file
>      - Add CLK_MUX_ROUND_CLOSEST to the mux clocks since they need a more
>        accurate clock frequency.
>      - Change 'rem' from u64 to u32 for function 'eswin_calc_pll' and
>        function 'clk_pll_recalc_rate'.
>      - Change 'rate' from u64 to unsigned long for function 'clk_pll_recalc_rate'.
>      - Fix build error with u64 divisor for function `clk_pll_set_rate'.
>        Reported-by: kernel test robot <lkp@intel.com>
>        Closes: https://lore.kernel.org/oe-kbuild-all/202602111424.mhTAakDX-lkp@intel.com/
> 
>    - Link to v11: https://lore.kernel.org/all/20260210095008.726-1-dongxuyang@eswincomputing.com/
> 
>    Change in v11:
>    - Updated driver file
>      - Add "Tested-by: Marcel Ziswiler <marcel@ziswiler.com> # ebc77" tag.
>      - Fix build error in function eswin_clk_register_clks.
>        Reported-by: kernel test robot <lkp@intel.com>
>        Closes: https://lore.kernel.org/oe-kbuild-all/202602060520.p4Hg35Ja-lkp@intel.com/
>    - Link to v10: https://lore.kernel.org/all/20260205093322.1030-1-dongxuyang@eswincomputing.com/
> 
>    Changes in v10:
>    - Updated driver file
>      - Add a private clock divider API named 'eswin_register_clkdiv' to
>        register divider clocks with private flag.
>        Define 'ESWIN_PRIV_DIV_MIN_2' private flag for registering the clock
>        dividers whose division ratio start from 2.
>        Implement the private set_rate, recalc_rate, and determine_rate accordingly.
>      - Add CLK_DIVIDER_ALLOW_ZERO flag to the clock dividers whose division
>        ratio start from 0.
>      - Replace CONFIG_ARCH_ESWIN with CONFIG_COMMON_CLK_ESWIN in the Makefile.
>      - Modify the help description of COMMON_CLK_EIC7700.
>      - Move register offset definitions from 'clk-eic7700.h' to 'clk-eic7700.c' and
>        remove the 'clk-eic7700.h'. Remove '_CTRL' from the offset names.
>      - Remove all unused headers.
>      - Use devm_platform_ioremap_resource() instead of devm_of_iomap().
>      - Export the functions from clk.c as symbols.
>      - Use readl_poll_timeout().
>      - Use 'clk_parent_data' and '.hw' instead of string parent names.
>      - Rename the header file from clk.h to common.h.
>      - Rename macros from EIC7700_* to ESWIN_* in common.h.
>      - Add a new function, 'eswin_clk_register_clks', which can register
>        divider, mux, gate, and fixed-factor clocks based on their types.
>      - Add structure 'eswin_clk_info' to manage the clocks that need to be registered
>        in a specific order.
>      - Add macros 'ESWIN_*_TYPE' to define divider, mux, gate, and fixed-factor clocks
>        with type. Add enum 'eswin_clk_type' for these types.
>      - Remove 'eswin_clk_register_mux_tbl'. Use 'eswin_clk_register_mux' to register
>        mux clocks with or without table.
>      - Add xtal24m as the parent clock of the PLL.
>      - Change 2025 to 2026 in all files.
> 
>    - Link to v9: https://lore.kernel.org/all/20251229105844.1089-1-dongxuyang@eswincomputing.com/
> 
>    Changes in v9:
>    - Updated driver file
>      - Checked return values of eswin_clk_register_*() in the probe function.
>      - Removed binding IDs check from pll functions in clk.c, as these functions
>        were exclusively used by pll clocks and did not require ID validation.
>      - The PLL structure has been extended with max_rate and min_rate fields to
>        explicitly define the frequency operating range of the PLL. These limits
>        were now utilized by the clk_pll_determine_rate() function.
>      - Removed __clk_lookup() in clk_pll_set_rate. Added clk_notifier support
>        in clk-eic7700.c.
>      - Added five previously missing clocks from [1].
> 
>    - Link to v8: https://lore.kernel.org/all/20251113013637.1109-1-dongxuyang@eswincomputing.com/
> 
>    Changes in v8:
>    - Updated YAML file
>      - Added "Acked-by: Troy Mitchell <troy.mitchell@linux.dev>"
>    - Updated driver file
>      - Changed Kconfig from bool to tristate.
>    - Updated MAINTAINERS file
>      - Added "ESWIN SOC SERIES CLOCK DRIVER"
> 
>    - Link to v7: https://lore.kernel.org/all/20251023071658.455-1-dongxuyang@eswincomputing.com/
> 
>    Changes in v7:
>    - Updated YAML file
>      - Added "Acked-by: Conor Dooley <conor.dooley@microchip.com>" for bindings.
>    - Updated driver file
>      - Added description for clk of eswin_calc_pll().
>      - Added macro EIC7700_MUX_TBL to manage mux clock-tree.
>      - Added eswin_clk_register_mux_tbl() to register mux clocks with
>        discontinuous parent indexes.
> 
>    - Link to v6: https://lore.kernel.org/all/20251009092029.140-1-dongxuyang@eswincomputing.com/
> 
>    Changes in v6:
>    - Removed config option patch dependency from cover letter, because the patch
>      was applied.
>    - Updated YAML file
>      - Added an oscillator as the clock input, named xtal24m.
>      - Added clocks property.
>    - Updated driver file
>      - Replaced fixed_rate_clk_xtal_24m with xtal24m.
>      - Dropped fixed_rate_clk_xtal_24m from driver. Because clock xtal24m was
>        registered by fixed-clock as oscillator.
> 
>    - Link to v5: https://lore.kernel.org/all/20250923084637.1223-1-dongxuyang@eswincomputing.com/
> 
>    Changes in v5:
>    - Removed vendor prefix patch dependency from cover letter, because the patch
>      was applied.
>    - Updated YAML file
>      - Placed the required after all properties.
>      - Removed patternProperties. Also removed compatible of eswin,pll-clock,
>        eswin,mux-clock, eswin,divider-clock and eswin,gate-clock as we have moved
>        clock tree from DTS to Linux driver.
>      - Removed the clock tree from DTS. Used clock-controller to manage all
>        clock. Removed all child nodes in clock-controller.
>      - Removed '#address-cells' and '#size-cells' properties, because the clock
>        controller did not need to define these properties.
>      - Removed eic7700-clocks.dtsi.
>      - Added dt-bindings header for clock IDs. Because used the IDs to register
>        clocks.
>    - Updated driver file
>      - Modified the commit for clock driver. Dropped indentation in commit.
>      - Removed CLK_OF_DECLARE(). Used *clk_hw_register* to register clocks. Used
>        devm_of_clk_add_hw_provider.
>      - Dropped singletons.
>      - Checked the value right after obtaining it.
>      - Removed the definitions of macro frequency in clk.h like CLK_FREQ_24M.
>      - Modified description of help in Kconfig.
>      - Added COMPILE_TEST. Added COMMON_CLK_ESWIN for clk.o. And added
>        "select COMMON_CLK_ESWIN" for clk-eic7700.c. Without COMMON_CLK_EIC7700,
>        clk.c could not be compiled.
>      - Used .determined_rate.
>      - Added macro definitions of EIC7700_DIV, EIC7700_FIXED, EIC7700_FACTOR,
>        EIC7700_MUX and EIC7700_PLL to manage clock tree.
>      - Added clk-eic7700.h to place eic7700 SoC clock registers.
>      - Removed refdiv_val and postdiv1_val from clk_pll_recalc_rate(). Because
>        these values were unused.
> 
>    - Link to v4: https://lore.kernel.org/all/20250815093539.975-1-dongxuyang@eswincomputing.com/
> 
>    Changes in v4:
>    - Updated YAML file
>      - Changed name from cpu-default-frequency to cpu-default-freq-hz.
>      - Dropped $ref of cpu-default-frequency.
>      - Added cpu-default-frequency for required.
>      - Removed cpu-default-frequency in updated file, because there was no
>        need to add cpu-default-frequency.
>      - Moved DIVIDER to DIV.
>      - Arranged the IDs in order.
>      - Dropped EIC7700_NR_CLKS.
>      - Removed dt-bindings eswin,eic7700-clock.h. Because IDs was not used,
>        and used clock device nodes.
>      - According to the updated driver codes, the YAML has been updated.
>    - Updated driver file
>      - Remove undocumented parameters "cpu_no_boost_1_6ghz" and
>        "cpu-default-frequency".
>      - Modified the comment and used the correct Linux coding style.
>      - Removed codes of voltage, because it was not the clock driver.
>      - Updated the formula of clock frequency calculation. Removed the logic
>        that only used register selection.
>      - Used CLK_OF_DECLARE() to register clocks. Registered pll-clock,
>        mux-clock, divider-clock, and gate-clock in clk-eic7700.c.
>        The specific implementation of clock registration was in clk.c.
>      - Added eic7700-clocks.dtsi.
>      - Moved device information to DTS. Put all clocks' node in the
>        eic7700-clocks.dtsi.
> 
>    - Link to v3: https://lore.kernel.org/all/20250624103212.287-1-dongxuyang@eswincomputing.com/
> 
>    Changes in v3:
>    - Update example, drop child node and add '#clock-cells' to the parent
>      node.
>    - Change parent node from sys-crg to clock-controller for this yaml.
>    - Drop "syscon", "simple-mfd" to clear warnings/errors by using "make
>      dt_binding_check". And these are not necessary.
>    - Add "cpu-default-frequency" definition in yaml for "undocumented ABI".
>    - Drop Reviewed-by, this is misunderstanding. We have not received such
>      an email.
>    - Link to v2: https://lore.kernel.org/all/20250523090747.1830-1-dongxuyang@eswincomputing.com/
> 
>    Changes in v2:
>    - Update example, drop child node.
>    - Clear warnings/errors for using "make dt_binding_check".
>    - Change to the correct format.
>    - Drop some non-stanard code.
>    - Use dev_err_probe() in probe functions.
>    - Link to v1: https://lore.kernel.org/all/20250514002233.187-1-dongxuyang@eswincomputing.com/
> 
> Xuyang Dong (3):
>    dt-bindings: clock: eswin: Documentation for eic7700 SoC
>    clk: eswin: Add eic7700 clock driver
>    MAINTAINERS: Add entry for ESWIN EIC7700 clock driver
> 
>   .../bindings/clock/eswin,eic7700-clock.yaml   |   46 +
>   MAINTAINERS                                   |    8 +
>   drivers/clk/Kconfig                           |    1 +
>   drivers/clk/Makefile                          |    1 +
>   drivers/clk/eswin/Kconfig                     |   15 +
>   drivers/clk/eswin/Makefile                    |    8 +
>   drivers/clk/eswin/clk-eic7700.c               | 1357 +++++++++++++++++
>   drivers/clk/eswin/clk.c                       |  591 +++++++
>   drivers/clk/eswin/common.h                    |  341 +++++
>   .../dt-bindings/clock/eswin,eic7700-clock.h   |  285 ++++
>   10 files changed, 2653 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml
>   create mode 100644 drivers/clk/eswin/Kconfig
>   create mode 100644 drivers/clk/eswin/Makefile
>   create mode 100644 drivers/clk/eswin/clk-eic7700.c
>   create mode 100644 drivers/clk/eswin/clk.c
>   create mode 100644 drivers/clk/eswin/common.h
>   create mode 100644 include/dt-bindings/clock/eswin,eic7700-clock.h
> 
> --
> 2.43.0
> 

