Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from outils.crapouillou.net ([89.234.176.41]:55138 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727268AbeHJALe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Aug 2018 20:11:34 -0400
From: Paul Cercueil <paul@crapouillou.net>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Lee Jones <lee.jones@linaro.org>,
        Mathieu Malaterre <malat@debian.org>,
        Ezequiel Garcia <ezequiel@collabora.co.uk>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-mips@linux-mips.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v6 00/24] Ingenic TCU patchset v6
Date: Thu,  9 Aug 2018 23:43:50 +0200
Message-Id: <20180809214414.20905-1-paul@crapouillou.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

This is the V6 of my Ingenic Timer/Counter Unit (TCU) patchset.

Major changes since V5:

- ingenic,timer-channel / ingenic,clocksource-channel devicetree
  properties for the ingenic-timer driver are gone. The system timer
  will default to use TCU channel #0, the clocksource will default to
  use TCU channel #1. When a client driver requests one of these TCU
  channels (e.g. the PWM driver), the ingenic-timer driver will
  dynamically switch the system timer or clocksource to a new TCU
  channel.

- The big watchdog commit in v5 was split into multiple smaller commits.

- The watchdog driver now just sets its clock to the lowest rate
  possible, and calculate the maximum timeout from that.

- The PWM driver now requests the TCU channels it wants to use using the
  API functions provided by ingenic-timer. Channels 0 and 1 can now be
  used.

- The register lengths in the pwm/watchdog nodes were fixed. They no
  longer overlap.

- Small fixes here and there, see each patch's changelog for more info.

Regards,
-Paul Cercueil
