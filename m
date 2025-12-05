Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9E1346E6E
	for <linux-clk@vger.kernel.org>; Fri,  5 Dec 2025 07:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764919344; cv=none; b=P5vsXkCVKXnH2Ar811T720mQmrkYJJ6Fj9+5CgeJNKFuDuyi81zx5UADgNMVirIGOK511mBVDP4KGXyZVKhx+DKppMNN9Rv9gpGsKCgDyffkN/q5Ipm4F77Pqub4wkms7KD7fE0WUTObj9wdpFC0Z3S21d8IGZWv0B6kYxq1NX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764919344; c=relaxed/simple;
	bh=zO4HfYHyG77lligX58GcpeUsXfmoKe4bOSQJtnv2qnw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=eCoUfsL4HKbEWh5X9OQsBm3I+VRyhQbRZLRvVASaY7s4x+TD9V8p1slkId5yGaaS/1LIeBKrR+ZXZkCa+BtdOAFnQC3ApFvdECBVnEpvt4Gw5HuF9pBQR3k4NIMW95KOmljG4/NOYsAqF2YjOgkvCYD7n5rbbt2FS8qFQvWeD8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bPg4ugI8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bPg4ugI8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477563e28a3so13440335e9.1
        for <linux-clk@vger.kernel.org>; Thu, 04 Dec 2025 23:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764919320; x=1765524120; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FzxFs8LzMrONfI1Cn6UlkRiahNYd5MhF609UmLpQAXo=;
        b=bPg4ugI8dIDJFbncc0JR8K1CIMwmZ5EN2mJwTMNzHtko24UPdJXcOUWSBA3NqL3o1J
         U6qYX5bo7xxMYpQuTyeDikPeiZotwBeHJ0uqclWWn7diKot7J34ROdY2NowUz7fjJOvZ
         h7TvnKU+XPBZiPfRBEPYVTHMrf6kE+guesH3Tk9m4v+Qvq54bFTZdo16plBkpCOjhQi1
         41lj8wgiQTiTtBLLOK5vAgyjSR/G3xC5WnTeEwEzYQHpw/lDrdFbbGEuF6OZU4kzHeLF
         G/sNDMGIU20Cw43MDGgDaQLMpqyW4ex0fKcrsEdLl87rUC70J41YCmaHdiEPKGRh+IeG
         v35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764919320; x=1765524120;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzxFs8LzMrONfI1Cn6UlkRiahNYd5MhF609UmLpQAXo=;
        b=TduhCRFkWNnnz8d1ZZrkE/UeEaWvQQLhNmO4+/ux68oDJp43Bvs1GkYK+zeRFqLlYS
         Amf/gZ3XnF6XVMVl82okTuSwL9PuBHZvf8RpzMtvRvNOvwKCM4JBmQeJaRL2KwxiIKqD
         GFmuNU7ScpWg50wV5LnwforZIL9VHzTQee2N9whVcYuOoqLjPb+h+J6OpNC1pV8GeFHF
         quO9e/uNtU0rx4+7lDk5ytsgbYzmG/9T/2XfgfmYD45pn5niGcwRY4IQMIsT3EHNOUxm
         DCMzheaXZqfl5uDvAn9E/L/qaNUsdOs9px3fJkNh8L6XqrYloi2xHlpCuTQ8nZwZeHCm
         ir8A==
X-Forwarded-Encrypted: i=1; AJvYcCXZtXVQ0zl2Kb8PxfIwAjsUMBFOy+sSoZy6VPFP1gazwOQEscReM2sfZ3tY7b+W0L3JRk8LV5nu/78=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNCk6ViHPixVnY5OtwQB3XXW92gY/KFw9WSFyAE3DPTpDEjhgc
	u+XZfWDSSZZ0gbzot3wyIx4t+CiPbjGMVB0XxOuhvurodXavvfHGnsLI7Iuipki3yeI=
X-Gm-Gg: ASbGnctSMVV5x7uS146q8aOCyePrRyHcHKOHVg+/LsdPGeNo4c/bvm3vkifiEOle6Gz
	i7wKiPZAgCYuarTIOgZ8i77hil+CMIuiOm7ck8u6UlblI3oiaPSkfiiD6YDew9SskoatIith6g8
	g5OMvRXTLtYwS9WvC1uZPH9EKj8oxDW0urEioJ2D4N/xD/jsmrQN+PKIBUw3DvgyKZf/ihDYPxd
	7eGzJcWH0FS8MsrrRkyyNvmWwOleS98o73ySdhKeGpm05Ki3Sw7uBnCzbfM85VMm/ulbBy3N7eo
	WGxpFGZis1+BNTK5J7S/1LYfXMLE9VVo1B0g1vmlNLnhH8NWFa9YvbI9c8g2UYoMnGoUQKUuboe
	4SYGlQDdxnv+hnuF/K4Rv5kU6YhXviliJidBmxhQk8n448rqSKrCDIER6YJCsxHsMipTOmpBbfA
	BIwQE1/25f2CutNCxe
X-Google-Smtp-Source: AGHT+IGY46mYanaDcTERQwYze8S9vgpM9dAzNgia/FegejO4LmlZHO08fLRhzsVOYwX0bqvVtCm5lQ==
X-Received: by 2002:a05:600c:1f90:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-4792eb12478mr66048795e9.2.1764919319970;
        Thu, 04 Dec 2025 23:21:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4792b12411fsm65146265e9.3.2025.12.04.23.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 23:21:59 -0800 (PST)
Date: Fri, 5 Dec 2025 10:21:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v2 3/3] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <202512050233.R9hAWsJN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-clk-microchip-fixes-v2-3-9d5a0daadd98@redhat.com>

Hi Brian,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/clk-microchip-core-remove-duplicate-determine_rate-on-pic32_sclk_ops/20251202-060924
base:   92fd6e84175befa1775e5c0ab682938eca27c0b2
patch link:    https://lore.kernel.org/r/20251201-clk-microchip-fixes-v2-3-9d5a0daadd98%40redhat.com
patch subject: [PATCH v2 3/3] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
config: arm-randconfig-r071-20251204 (https://download.01.org/0day-ci/archive/20251205/202512050233.R9hAWsJN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512050233.R9hAWsJN-lkp@intel.com/

smatch warnings:
drivers/clk/microchip/clk-core.c:300 roclk_get_parent() warn: signedness bug returning '(-22)'
drivers/clk/microchip/clk-core.c:833 sclk_get_parent() warn: signedness bug returning '(-22)'

vim +300 drivers/clk/microchip/clk-core.c

ce6e11884659988 Purna Chandra Mandal 2016-05-13  286  static u8 roclk_get_parent(struct clk_hw *hw)
                                                             ^^
returns a u8.

ce6e11884659988 Purna Chandra Mandal 2016-05-13  287  {
ce6e11884659988 Purna Chandra Mandal 2016-05-13  288  	struct pic32_ref_osc *refo = clkhw_to_refosc(hw);
ce6e11884659988 Purna Chandra Mandal 2016-05-13  289  	u32 v, i;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  290  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  291  	v = (readl(refo->ctrl_reg) >> REFO_SEL_SHIFT) & REFO_SEL_MASK;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  292  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  293  	if (!refo->parent_map)
ce6e11884659988 Purna Chandra Mandal 2016-05-13  294  		return v;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  295  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  296  	for (i = 0; i < clk_hw_get_num_parents(hw); i++)
ce6e11884659988 Purna Chandra Mandal 2016-05-13  297  		if (refo->parent_map[i] == v)
ce6e11884659988 Purna Chandra Mandal 2016-05-13  298  			return i;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  299  
ce6e11884659988 Purna Chandra Mandal 2016-05-13 @300  	return -EINVAL;
                                                        ^^^^^^^^^^^^^^^
So it can't return negative error codes.

ce6e11884659988 Purna Chandra Mandal 2016-05-13  301  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

