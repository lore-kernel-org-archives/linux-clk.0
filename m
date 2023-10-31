Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B19C4332F
	for <linux-clk@archiver.kernel.org>; Tue, 31 Oct 2023 09:47:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbjJaJrJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Oct 2023 05:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbjJaJrI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Oct 2023 05:47:08 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7048C1
        for <linux-clk@vger.kernel.org>; Tue, 31 Oct 2023 02:47:03 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-32f78dcf036so1801782f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 31 Oct 2023 02:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1698745622; x=1699350422; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wp+G2Y0kUCo4IJDDbdOBo/ZQnoQFINk+z53Z+UNOY4c=;
        b=zFEhtmaj+in90xfM/+FCbtoUxY3Dpi3dYv2nRaIygbghOO70qmeZwdFCWVSVjkDz9o
         BW1TPJ4/tWGkK6uVgDMD2Au+29iLgnNl/BgalGH2zVnf2af08DIStAmQiH5xNfA7nMrC
         Vjtg93aQ4BM9+TuGQOKTkUtobRESwC4dn2YjoGDtkCE0U3FZpd1hy+0FxmFPEZJjvboC
         0VOs8Wk37rNJgLDJZ4Pv1oysHMrP3nig6U+wC0yWKRhHYDSlOSVcixLhla1i28Rd3E/Q
         rDd4HOrSlt5NjWYw1Wy7PCuTcPNimmQ3jAwux8Fl4mt/wtOaA8zADyOaEuRaZK0cGS2i
         rNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698745622; x=1699350422;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wp+G2Y0kUCo4IJDDbdOBo/ZQnoQFINk+z53Z+UNOY4c=;
        b=mgn+oBzqTAL4la932yF3En4s/cD3SFM23GbUGei3dbyPu37NRG9C04KIdI4rEPi+iI
         gBwkWFPZdtP5dW4fvlPu3aIxXfijl2rUr0beGXy9w8Pc2I7PhmSMX2WNmJ4gRqk68RX7
         AjO609dYYqznrKkP2czQCn8f0sNrUdHe/AijduPzLjnwaZfFOOMOeqvNF3ARIonOv3iQ
         SUjiv3K7AL3g1XCM82ieBq5FEo4LdM+V/aAqU1fcbh+gg3/isFumeLMRteaYqOa7m6IQ
         50Vvw6GyPuNh97FBJdWqkyU9+VhA8Sdduly2AvknX9R3u0TO6XKyfvxvq6bCm4n6EfEx
         SyOg==
X-Gm-Message-State: AOJu0YyrpWz328Oxaj9ErliJva38Q4TLZQEUWpkhdmRdhWoXl03NlAXv
        2YYhojBvWD/Z6GiCqHnRmHcn7g==
X-Google-Smtp-Source: AGHT+IGn8SP/xXjHKwdkZ0bPOm/kbVTYJ4bFQJVsQu1xLfpeZT18Ofr7kXVDesnbqXwrLabLpgR5oA==
X-Received: by 2002:a5d:6da9:0:b0:32f:7260:1220 with SMTP id u9-20020a5d6da9000000b0032f72601220mr2335983wrs.17.1698745621939;
        Tue, 31 Oct 2023 02:47:01 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id s26-20020adfa29a000000b003232380ffd5sm1059487wra.106.2023.10.31.02.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 02:47:01 -0700 (PDT)
Date:   Tue, 31 Oct 2023 10:47:00 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     Michal Michalik <michal.michalik@intel.com>
Cc:     netdev@vger.kernel.org, vadim.fedorenko@linux.dev,
        arkadiusz.kubalewski@intel.com, jonathan.lemon@gmail.com,
        pabeni@redhat.com, poros@redhat.com, milena.olech@intel.com,
        mschmidt@redhat.com, linux-clk@vger.kernel.org, bvanassche@acm.org,
        kuba@kernel.org, davem@davemloft.net, edumazet@google.com
Subject: Re: [PATCH RFC net-next v2 0/2] selftests/dpll: DPLL subsystem
 integration tests
Message-ID: <ZUDNFHlO4GtA/UAh@nanopsycho>
References: <20231030165326.24453-1-michal.michalik@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231030165326.24453-1-michal.michalik@intel.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Mon, Oct 30, 2023 at 05:53:24PM CET, michal.michalik@intel.com wrote:
>The recently merged common DPLL interface discussed on a newsletter[1]

"newsletter"? Sounds a bit odd to me :)


>is introducing new, complex subsystem which requires proper integration
>testing - this patch adds core for such framework, as well as the

"Patchset" perhaps? Also, what do you mean by "core"? The sentence
sounds a bit weird to me.


>initial test cases. Framework does not require neither any special
>hardware nor any special system architecture.
>
>To properly test the DPLL subsystem this patch adds fake DPLL devices and it's

For patch desctiption, please stay within 72cols.
Also, "it's" is most probably wrong in this sentence.


>pins implementation to netdevsim. Creating netdevsim devices and adding ports
>to it register new DPLL devices and pins. First port of each netdevsim device

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ This sentence does not make
sense to me. Pehaps rephrase a bit?


>acts as a entitiy which registers two DPLL devices: EEC and PPS DPLLs. First

typo: "entitiy"

>port also register the common pins: PPS and GNSS. Additionally each port
>register also RCLK (recovered clock) pin for itself. That allow us to check
>mutliple scenarios which might be problematic in real implementations (like
>different ordering etc.)
>
>Patch adds few helper scripts, which are:
>1) tools/testing/selftests/dpll/run_dpll_tests.sh

Please make this part of
tools/testing/selftests/drivers/net/netdevsim/
No special threat of dpll needed.


>    Script is checking for all dependencies, creates temporary
>    environment, installs required libraries and run all tests - can be
>    used standalone
>2) tools/testing/selftests/dpll/ynlfamilyhandler.py˙
>    Library for easier ynl use in the pytest framework - can be used
>    standalone
>
>[1] https://lore.kernel.org/netdev/169494842736.21621.10730860855645661664.git-patchwork-notify@kernel.org/
>
>Changelog:
>v1 -> v2:
>- moved from separate module to implementation in netdevsim
>
>Michal Michalik (2):
>  netdevsim: implement DPLL for subsystem selftests
>  selftests/dpll: add DPLL system integration selftests
>
> drivers/net/Kconfig                              |   1 +
> drivers/net/netdevsim/Makefile                   |   2 +-
> drivers/net/netdevsim/dpll.c                     | 438 +++++++++++++++++++++++
> drivers/net/netdevsim/dpll.h                     |  81 +++++
> drivers/net/netdevsim/netdev.c                   |  20 ++
> drivers/net/netdevsim/netdevsim.h                |   4 +
> tools/testing/selftests/Makefile                 |   1 +
> tools/testing/selftests/dpll/Makefile            |   8 +
> tools/testing/selftests/dpll/__init__.py         |   0
> tools/testing/selftests/dpll/config              |   2 +
> tools/testing/selftests/dpll/consts.py           |  34 ++
> tools/testing/selftests/dpll/dpll_utils.py       | 109 ++++++
> tools/testing/selftests/dpll/requirements.txt    |   3 +
> tools/testing/selftests/dpll/run_dpll_tests.sh   |  75 ++++
> tools/testing/selftests/dpll/test_dpll.py        | 414 +++++++++++++++++++++
> tools/testing/selftests/dpll/ynlfamilyhandler.py |  49 +++
> 16 files changed, 1240 insertions(+), 1 deletion(-)
> create mode 100644 drivers/net/netdevsim/dpll.c
> create mode 100644 drivers/net/netdevsim/dpll.h
> create mode 100644 tools/testing/selftests/dpll/Makefile
> create mode 100644 tools/testing/selftests/dpll/__init__.py
> create mode 100644 tools/testing/selftests/dpll/config
> create mode 100644 tools/testing/selftests/dpll/consts.py
> create mode 100644 tools/testing/selftests/dpll/dpll_utils.py
> create mode 100644 tools/testing/selftests/dpll/requirements.txt
> create mode 100755 tools/testing/selftests/dpll/run_dpll_tests.sh
> create mode 100644 tools/testing/selftests/dpll/test_dpll.py
> create mode 100644 tools/testing/selftests/dpll/ynlfamilyhandler.py
>
>-- 
>2.9.5
>
>base-commit: 55c900477f5b3897d9038446f72a281cae0efd86
