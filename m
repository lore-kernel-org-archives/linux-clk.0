Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B601634EF1B
	for <linux-clk@vger.kernel.org>; Wed, 11 Feb 2026 10:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770807358; cv=none; b=uOQ0n3Z48sB1HrkLkqErcq1nn4VOvmTZEGMYipnBTXFqFD/8i2yVYgeokzX633GAJAZXjfyJw54nj2vOZUyKyx0gcK1wAb6WKxJLVXDgSJ6dHS0qJRNcu161/tDHew4NnFEwbF49jtc7s0a4fwIgr8r2ISNRnLgFhtRuM8AJr3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770807358; c=relaxed/simple;
	bh=vQxbOzdjfJYfaq3MX4JMmdz+HVAp3Xh6PsUXQZNp7PA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZoWS9HH/fQuDOiT+U445j14lE8/1YZ5idNZFxBszjyNuYqIORP2NMfHjPt0yLaisD31hCXkecAtzcS0/pfZtx223GBpsI0nQzsVRoPzLKEophX+CIFYz1Uyk/h0zfyoLhNrr3vDOl8oVCtGECQPQOjilcZq1jpuwxeI5CPotHW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mu2wuKHz; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mu2wuKHz"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a90055b9e9so28146255ad.1
        for <linux-clk@vger.kernel.org>; Wed, 11 Feb 2026 02:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770807355; x=1771412155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=45Dgn0M186ZnKFMAZZJdlS+m794VI4H1CnRvG5UXt7c=;
        b=Mu2wuKHzbajX+dKkPp71uI+xxpcAoqZHLijFmxnD3nTydB2quWRRtu9rtNzqcE6k2t
         6xazwaNpKOAkMxBbT4lPuo34kAKGc095jEm72wMS32F30OQ2dXthNLvqVJKeGKJD9WWm
         dqUIPozpYiYwzv7r2vvZK3nNyJ35Eg6SLpfLot7yt4Le7qGHRuJLNpeTARcdRHJL0278
         9QOQtVu4gb00iAAgiqm52BaRn/kAAysdFjKty2LATO+OBMRW1uD+dNxO0uM7DKU+IMgF
         Vc5fieajbYtcz+0BtTE8qeDO8zem1RtxUU3ppS6yTwE6Z7rJeCKBS+TbBvhbhTqRZhwI
         1Isg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770807355; x=1771412155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45Dgn0M186ZnKFMAZZJdlS+m794VI4H1CnRvG5UXt7c=;
        b=WRWhfNfXDwAz3/iyliBDpq45DBxj8oQ4qN0Uw8YHRhdPWZhq672PMoz5xXLb+TilwB
         hq8dJ7ufvED3XRNj62msDMnttVB5sQrMKUBHWVcTrp1ozOm/YKOAYbWGbufs8LqIXomn
         rtOJfVTfjaBMvhSMD+scA5RrHmwQNGROyA10d7H1BTGxCbV374MgbVAZdAZZ7sGTdNgD
         OaNjSnrxE62iB6HYi29rbSg2nbuiM60c8iC/bEZr0mrmnGc2tqPbh9lAfQc9z1S+Rv6f
         2Tvc+ZCLuZX8ZnDzZXqKBMyYEI6CsCwkUR+j68owgHVfsHK71m9sZMlMJuzZfUpaY8pt
         twbA==
X-Forwarded-Encrypted: i=1; AJvYcCWijNft046R0Tr3q3oDWX8vSw/y17wxa1nW/T9FtACxV+U3Sclot2FNVnhaaAx6LgpJg1waje/zvp0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrsz1kNNZj+M2DJWY8HbMW2OE3zhceGuRK6TWjhBsDE0TyxRxQ
	QmzBgvdpccEDEvMnohLIVihtA2jpULmc+fXeDxJuwQ0/K9JO/akv1o1m
X-Gm-Gg: AZuq6aK05rmiIzj8CQmISt+e4e2miCEKBl3KRvZL9xbPSjVydujPUn4Kk8IVgXgPo2z
	s0GU6efdgpXeMmQFBzaVBVgO/kARWaIGxTSQgtkQ3auyp/z5+uIOOLTyliCKD1h5KGI+X7llAgD
	UuNjzUEEvq8sUMnvOQ2o6LGCZ/UWXj54w9H+yCgpCeyI3zHsEf3ATLQMEbzCU5B9Px2M/H0UmKN
	brIR9OA4Ok5524BhnrbFzE+RaToq6vcoXXBfqMq2jgt439kmuW5HYkG5lcvW7Gb9Y2bPJKrMEOK
	4O+Y5pm3u/YUJW0lCljHRTWq6j0ZDgZ7ykiGJQ5pPn0/tJC/PWMqEnd5+sh/q2PzS7PZQnB3ieg
	nLkivCmj1XbrQ9gPNZTMhigUbJyEIrXdsanpDD8RT8aQDbehAavV0vDleheHBRLECLhL3UukDOw
	W357KEH1VmOG0ncgW99CMXpmSX5UfJ2kCu8m4=
X-Received: by 2002:a17:903:17cf:b0:2aa:dd98:197e with SMTP id d9443c01a7336-2ab29fb5a57mr18177605ad.51.1770807355036;
        Wed, 11 Feb 2026 02:55:55 -0800 (PST)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2997bf86sm19287105ad.74.2026.02.11.02.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 02:55:54 -0800 (PST)
Message-ID: <4f6580f3-3759-4b33-a3d3-54bef0a7ae83@gmail.com>
Date: Wed, 11 Feb 2026 02:53:44 -0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/3] Add driver support for ESWIN eic700 SoC clock
 controller
To: dongxuyang@eswincomputing.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, troy.mitchell@linux.dev, bmasney@redhat.com
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com,
 marcel@ziswiler.com
References: <20260210095008.726-1-dongxuyang@eswincomputing.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260210095008.726-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Xuyang,

Do you have a device-tree that can work with this patchset and enable
eMMC/eth/SATA on Hifive P550? Given these drivers are already merged,
I'd like to test it myself. I just need a proper device-tree. I checked
your github repo: https://github.com/eswincomputing/linux-next, which
hasn't been updated for a while, and none of the branches are based on
the latest v6.19-rc7

Bo

On 2/10/26 01:50, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
> 
> The link [1] provides the official documentation for the EIC7700. Section 3.2
> covers the clock subsystem.
> 
> [1] https://www.sifive.com/document-file/eic7700x-datasheet
> 
> Updates:
>    Change in v11:
>    - Updated driver file
>      - Add "Tested-by: Marcel Ziswiler <marcel@ziswiler.com> # ebc77" tag.
>      - Fix build error in function eswin_clk_register_clks
>        (reported by kernel test robot).
>        Reported-by: kernel test robot <lkp@intel.com>
>        Closes: https://lore.kernel.org/oe-kbuild-all/202602060520.p4Hg35Ja-lkp@intel.com/
> 
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
>    clock: eswin: Add eic7700 clock driver
>    MAINTAINERS: Add entry for ESWIN EIC7700 clock driver
> 
>   .../bindings/clock/eswin,eic7700-clock.yaml   |   46 +
>   MAINTAINERS                                   |    8 +
>   drivers/clk/Kconfig                           |    1 +
>   drivers/clk/Makefile                          |    1 +
>   drivers/clk/eswin/Kconfig                     |   15 +
>   drivers/clk/eswin/Makefile                    |    8 +
>   drivers/clk/eswin/clk-eic7700.c               | 1337 +++++++++++++++++
>   drivers/clk/eswin/clk.c                       |  579 +++++++
>   drivers/clk/eswin/common.h                    |  373 +++++
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
> 2.34.1
> 

