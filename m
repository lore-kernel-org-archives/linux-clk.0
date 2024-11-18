Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E6519AA56
	for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731935453; cv=none; b=hXyAmn18wykWdpY222OxqOAjlf41X/qKh+wCsUZWsDROc8U2wsNB7A15DHDzAjK9zBgdJLAS0SsBQ5JGJVd5rhT+fwG7013SovUwOIuNpag1zcbhYcBH4Qpd5eDvTOzzcSpqMLIu30O5WoGtv/S1qIYL39ZJ09oEdD0i27jkoc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731935453; c=relaxed/simple;
	bh=Op2I8dr35muBs/N0wwVSV8bMfv9/DBnetL23eBdhKSw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kqarYZuMtK1jp5eXx3XMgmn4kO8HBhVULK8aCDwDfYImmoYEXeiQE0anUPdlwRuCR74TTuMuJJZLifwn/6WznabxAYHKK0b03OszQ+eJ5XdiYADMtW+QfrJIVfpLkhmv2mbm1N9iQV71kn4u1bTpkRMUU4Zhi1dwDRRPcl27ayY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ATOqcKMv; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ATOqcKMv"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-29680f21217so532263fac.1
        for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 05:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731935451; x=1732540251; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YTw7RWvWoc0SMzgWBayRA2wygazsMYV1x3KYiELVVeY=;
        b=ATOqcKMvMqdBktepLN7IVlyJHmK7HwTYDyqMhtLBSYAcr31JW/WpKyJRR1OJ8d5Poy
         /HwftnGY7yI0e1Akg8u5pUGxvUEf3z7Nt2cUVWCIWDHaP468FHb4HI1KemUpc+fEXlfQ
         khM37E5dJqhFM7iBh1tD5wvD9xHV6pGjMVZlwjqajn/mBva9Ywgtg2zRnZI9hWNfgyZH
         uuoG/A5b9LHbeovtz+ya2U0tZPXiyD0Aw9D5a/Iv2ADFFDof7TJr18XxQraawigKyhXX
         u3GyE1TH9XtQpCmzYxlAMC1ZDDRUxcPG8wJgDAYYhijQU+8UXtG7yk3WJqHsoZrZpyHe
         tjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731935451; x=1732540251;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YTw7RWvWoc0SMzgWBayRA2wygazsMYV1x3KYiELVVeY=;
        b=qjEsRdItVyKYfpM0WEIl48jXShpBlrPeJ3jiUETVZIokA3MQ0E0C0WPnN9pq3mgwFa
         /AB0p9Xu1dEo4alfylCMUpyCKqMjbhWfgNeyKkjqe+4mbdY6+qW1LjD4rXoQLCblh8kv
         h+U6C8auRa9HxqShUYEgRF73rccEOpl/kMhVk5t/5EMaxO3aXJEbjDPqDCMhsG9oYJZn
         P3W6qI31HjXoksdIm2K3/0n5E/bRgDm+4xNWUFBNbfsbby1QPn/1L3RHWr3ayXIVjqWE
         nc1Fx+oxlRlzBfc/gZc9SSWRzQzGwRbNrTvtBg+jiUQmLTcPLqnsWd/a6ehY0GNhXmIb
         Igow==
X-Gm-Message-State: AOJu0YyM8jIV1CuyYG2e6n78o/Wwe51nzuzLWH2E7DPfdgdeOoQ6wf+3
	AjY9mp6jZzVVsf1Iiw4AubEpR557h4bvfSSp/FMACeeeX69CW2Hek3muu6O273zS8aH8C5oD6ed
	sebDpK97B+d+mOdzFT0CFWvD/V8FZMI68CEood7esUaXG1c5AxMw=
X-Google-Smtp-Source: AGHT+IHGcZHpXIet+VQyE38gSaCHSlt7RMcXTgIjtwxRtsxmDxLBiM8FQSw90gh105xogQgSb+fpkFDsIdEuZz4rOJY=
X-Received: by 2002:a05:6808:2017:b0:3e7:a284:9b13 with SMTP id
 5614622812f47-3e7bc7d87a8mr10574272b6e.21.1731935450734; Mon, 18 Nov 2024
 05:10:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 18 Nov 2024 18:40:38 +0530
Message-ID: <CA+G9fYs+gwu67Y0Tm2FHfNuUA5eLxT2FAWkfKvYrEbXJUXXiiA@mail.gmail.com>
Subject: drivers/clk/davinci/psc.c:281:10: error: incompatible integer to
 pointer conversion returning 'int' from a function with result type 'struct
 davinci_lpsc_clk *' [-Wint-conversion]
To: linux-clk <linux-clk@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: hanchunchao@inspur.com, Stephen Boyd <sboyd@kernel.org>, david@lechnology.com, 
	Michael Turquette <mturquette@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The davinci_all_defconfig and multi_v5_defconfig builds failed with clang-19 and
clang-nightly on the Linux next-20241115 tag for the arm architectures.
Same build pass with gcc-13.

First seen on Linux next-20241118 tag.
  Good: next-20241115
  Bad:  next-20241118

arm
* arm, build
  - clang-19-davinci_all_defconfig
  - clang-19-multi_v5_defconfig
  - clang-19-multi_v5_defconfig-65236a87
  - clang-nightly-davinci_all_defconfig
  - clang-nightly-multi_v5_defconfig
  - clang-nightly-multi_v5_defconfig-65236a87

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build error:
---------
drivers/clk/davinci/psc.c:281:10: error: incompatible integer to
pointer conversion returning 'int' from a function with result type
'struct davinci_lpsc_clk *' [-Wint-conversion]
  281 |                 return -ENOMEM;
      |                        ^~~~~~~
1 error generated.
make[6]: *** [scripts/Makefile.build:200: drivers/clk/davinci/psc.o] Error 1

Build image:
-----------
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2p15j4StPnjuuRXu3qgndSTbahH/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241118/testrun/25881399/suite/build/test/clang-19-davinci_all_defconfig/history/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241118/testrun/25881399/suite/build/test/clang-19-davinci_all_defconfig/details/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241118/testrun/25881399/suite/build/test/clang-19-davinci_all_defconfig/log

Steps to reproduce:
------------
- # tuxmake --runtime podman --target-arch arm --toolchain clang-19
--kconfig davinci_all_defconfig LLVM=1 LLVM_IAS=1

metadata:
----
  git describe: next-20241118
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: ae58226b89ac0cffa05ba7357733776542e40216
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2p15j4StPnjuuRXu3qgndSTbahH/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2p15j4StPnjuuRXu3qgndSTbahH/
  toolchain: clang-19
  config: davinci_all_defconfig and multi_v5_defconfig
  arch: arm

--
Linaro LKFT
https://lkft.linaro.org
