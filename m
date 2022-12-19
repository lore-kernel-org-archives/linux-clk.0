Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FC0C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 19 Dec 2022 09:14:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbiLSJO2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Dec 2022 04:14:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231550AbiLSJON (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Dec 2022 04:14:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E09FDBCB9
        for <linux-clk@vger.kernel.org>; Mon, 19 Dec 2022 01:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671441188;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q3p9EZ8ldUCyzfQTOYOKoUroF8oLLp0ISbvBLH22RLk=;
        b=Ba7Gf0j96xfOLthBYcMn0YLWPpc/lvFM/C6lWtuf7lBZZRhlHuSndthoZXZviKPbIYP305
        s/D8PlkmMTPLXNXXpB/KVWCFZxi7bbrBqAJvD/W2jivAnbVnx1YtQg9Iatve5c209v/aMd
        uutR7kFv+e+5a20/FmjJYsswSf6i7is=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-163-IRyaLk_WNLa4T-C-1IH5qg-1; Mon, 19 Dec 2022 04:13:07 -0500
X-MC-Unique: IRyaLk_WNLa4T-C-1IH5qg-1
Received: by mail-wm1-f72.google.com with SMTP id 9-20020a1c0209000000b003d1c0a147f6so6352666wmc.4
        for <linux-clk@vger.kernel.org>; Mon, 19 Dec 2022 01:13:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q3p9EZ8ldUCyzfQTOYOKoUroF8oLLp0ISbvBLH22RLk=;
        b=pMJqWdpHaKn1EUkJ75AOmfO1FdmcTPPEuY2j2vmk5kJLrT7N0QOz72XLyO6M/19w1G
         W1k6f6/nmZtSPUVk4fLKRnHBU17SALBHWlKLaa2IGke73cKcZtza/5TcOOzGoFuRGokq
         Z7bGTmYp9fov7nFpNdpI3YEajmGuHY86vhPVrMWm1ftTdyX0TKCxMrVsRcmfAoZgDbjN
         Q8FDvo2MfEV2kLT4MonqOn5q7/3QvIxFibgqnBMbMyqGzGtKn6IfkwmPo/am+0V404n9
         K9wZ67xxTIVoLb0iaj06dF2b7CkKifAqdzwuJwm0cn/sKzsRgT1Uo9lsvND93TMvytyT
         rOCQ==
X-Gm-Message-State: ANoB5pmSUS+bvKWNLXr9LNcJCye+kx1Zn44r5MzUhyX5a6I0O5L1QzhQ
        jHWAuT8tucJr2+egdDwGgiVnkj3koZawl9Ry/uiRC4Ff0oP3tDDXw3HKP9VWZI9wuUTGlzVk2PA
        5cgw83D2Bg2Qz35Gi8B0g
X-Received: by 2002:adf:ee88:0:b0:24a:9b90:b621 with SMTP id b8-20020adfee88000000b0024a9b90b621mr26052041wro.30.1671441186477;
        Mon, 19 Dec 2022 01:13:06 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4BgdvKzAtgyIFlDc81nV+WrS3W3PY9JeL48r8SaAfQ+I1dh+CB69vl6wqcAEKAebtXHJGG+Q==
X-Received: by 2002:adf:ee88:0:b0:24a:9b90:b621 with SMTP id b8-20020adfee88000000b0024a9b90b621mr26052021wro.30.1671441186193;
        Mon, 19 Dec 2022 01:13:06 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-101-173.dyn.eolo.it. [146.241.101.173])
        by smtp.gmail.com with ESMTPSA id cc6-20020a5d5c06000000b002428c4fb16asm9423740wrb.10.2022.12.19.01.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 01:13:05 -0800 (PST)
Message-ID: <60c011eb99c1859d4ee7191d4cbc20d11548f327.camel@redhat.com>
Subject: Re: [RFC PATCH v4 3/4] dpll: documentation on DPLL subsystem
 interface
From:   Paolo Abeni <pabeni@redhat.com>
To:     Vadim Fedorenko <vfedorenko@novek.ru>,
        Jakub Kicinski <kuba@kernel.org>,
        Jiri Pirko <jiri@resnulli.us>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>
Cc:     netdev@vger.kernel.org, Vadim Fedorenko <vadfed@fb.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 19 Dec 2022 10:13:04 +0100
In-Reply-To: <20221129213724.10119-4-vfedorenko@novek.ru>
References: <20221129213724.10119-1-vfedorenko@novek.ru>
         <20221129213724.10119-4-vfedorenko@novek.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

I have a just a few minor notes WRT the documentation - which was a
very useful entry point for me to help understanding the subsystem.

On Wed, 2022-11-30 at 00:37 +0300, Vadim Fedorenko wrote:
> From: Vadim Fedorenko <vadfed@fb.com>
> 
> Add documentation explaining common netlink interface to configure DPLL
> devices and monitoring events. Common way to implement DPLL device in
> a driver is also covered.
> 
> Co-developed-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
> Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
> Signed-off-by: Vadim Fedorenko <vadfed@fb.com>
> ---
>  Documentation/networking/dpll.rst  | 271 +++++++++++++++++++++++++++++
>  Documentation/networking/index.rst |   1 +
>  2 files changed, 272 insertions(+)
>  create mode 100644 Documentation/networking/dpll.rst
> 
> diff --git a/Documentation/networking/dpll.rst b/Documentation/networking/dpll.rst
> new file mode 100644
> index 000000000000..58401e2b70a7
> --- /dev/null
> +++ b/Documentation/networking/dpll.rst
> @@ -0,0 +1,271 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===============================
> +The Linux kernel DPLL subsystem
> +===============================
> +
> +
> +The main purpose of DPLL subsystem is to provide general interface
> +to configure devices that use any kind of Digital PLL and could use
> +different sources of signal to synchronize to as well as different
> +types of outputs.
> +The main interface is NETLINK_GENERIC based protocol with an event
> +monitoring multicast group defined.
> +
> +
> +Pin object
> +==========
> +A pin is amorphic object which represents either input and output, it
> +could be internal component of the device, as well as externaly
> +connected.
> +The number of pins per dpll vary, but usually multiple pins shall be
> +provided for a single dpll device.
> +Direction of a pin and it's capabilities are provided to the user in
> +response for netlink dump request messages.
> +Pin can be shared by multiple dpll devices. Where configuration on one
> +pin can alter multiple dplls (i.e. DPLL_PIN_SGINAL_TYPE, DPLL_PIN_TYPE,

Likely typo above: DPLL_PIN_SIGNAL_TYPE

> +DPLL_PIN_STATE), or just one pin-dpll pair (i.e. DPLL_PIN_PRIO).
> +Pin can be also a MUX type, where one or more pins are attached to
> +a parent pin. The parent pin is the one directly connected to the dpll,
> +which may be used by dplls in DPLL_MODE_AUTOMATIC selection mode, where
> +only pins directly connected to the dpll are capable of automatic
> +source pin selection. In such case, pins are dumped with
> +DPLLA_PIN_PARENT_IDX, and are able to be selected by the userspace with
> +netlink request.
> +
> +Configuration commands group
> +============================
> +
> +Configuration commands are used to get or dump information about
> +registered DPLL devices (and pins), as well as set configuration of
> +device or pins. As DPLL device could not be abstract and reflects real
> +hardware, there is no way to add new DPLL device via netlink from user
> +space and each device should be registered by it's driver.

Side note: in the long run we could end-up with a virtual/dummy dpll
driver for self-tests and/or reference's implementation sake.

> +
> +List of command with possible attributes
> +========================================
> +
> +All constants identifying command types use ``DPLL_CMD_`` prefix and
> +suffix according to command purpose. All attributes use ``DPLLA_``
> +prefix and suffix according to attribute purpose:
> +
> +  ============================  =======================================
> +  ``DEVICE_GET``                userspace to get device info
> +    ``ID``                      attr internal dpll device index
> +    ``NAME``                    attr dpll device name
> +    ``MODE``                    attr selection mode
> +    ``MODE_SUPPORTED``          attr available selection modes
> +    ``SOURCE_PIN_IDX``          attr index of currently selected source
> +    ``LOCK_STATUS``             attr internal frequency-lock status
> +    ``TEMP``                    attr device temperature information
> +    ``NETIFINDEX``              attr dpll owner Linux netdevice index

should we include also the cookie (or wuhatever will be used for
persistent device identification) into the readable attributes list? 

> +  ``DEVICE_SET``                userspace to set dpll device
> +                                configuration
> +    ``ID``                      attr internal dpll device index
> +    ``MODE``                    attr selection mode to configure
> +    ``PIN_IDX``                 attr index of source pin to select as
> +                                active source

It looks like the descrition for the above attribute ('PIN_IDX') and
'SOURCE_PIN_IDX' has been swapped.

> +  ``PIN_SET``                   userspace to set pins configuration
> +    ``ID``                      attr internal dpll device index
> +    ``PIN_IDX``                 attr index of a pin to configure
> +    ``PIN_TYPE``                attr type configuration value for
> +                                selected pin
> +    ``PIN_SIGNAL_TYPE``         attr signal type configuration value
> +                                for selected pin
> +    ``PIN_CUSTOM_FREQ``         attr signal custom frequency to be set
> +    ``PIN_STATE``               attr pin state to be set
> +    ``PIN_PRIO``                attr pin priority to be set
> +
> +Netlink dump requests
> +=====================
> +The ``DEVICE_GET`` command is capable of dump type netlink requests.
> +In such case the userspace shall provide ``DUMP_FILTER`` attribute
> +value to filter the response as required.
> +If filter is not provided only name and id of available dpll(s) is
> +provided. If the request also contains ``ID`` attribute, only selected
> +dpll device shall be dumped.

Should we explicitly document even the required permissions?

> +
> +Possible response message attributes for netlink requests depending on
> +the value of ``DPLLA_DUMP_FILTER`` attribute:
> +
> +  =============================== ====================================
> +  ``DPLL_DUMP_FILTER_PINS``       value of ``DUMP_FILTER`` attribute
> +    ``PIN``                       attr nested type contain single pin
> +                                  attributes
> +    ``PIN_IDX``                   attr index of dumped pin
> +    ``PIN_DESCRIPTION``           description of a pin provided by
> +                                  driver
> +    ``PIN_TYPE``                  attr value of pin type
> +    ``PIN_TYPE_SUPPORTED``        attr value of supported pin type
> +    ``PIN_SIGNAL_TYPE``           attr value of pin signal type
> +    ``PIN_SIGNAL_TYPE_SUPPORTED`` attr value of supported pin signal
> +                                  type
> +    ``PIN_CUSTOM_FREQ``           attr value of pin custom frequency
> +    ``PIN_STATE``                 attr value of pin state
> +    ``PIN_STATE_SUPPORTED``       attr value of supported pin state
> +    ``PIN_PRIO``                  attr value of pin prio
> +    ``PIN_PARENT_IDX``            attr value of pin patent index
> +    ``PIN_NETIFINDEX``            attr value of netdevice assocaiated
> +                                  with the pin
> +  ``DPLL_DUMP_FILTER_STATUS``     value of ``DUMP_FILTER`` attribute
> +    ``ID``                        attr internal dpll device index
> +    ``NAME``                      attr dpll device name
> +    ``MODE``                      attr selection mode
> +    ``MODE_SUPPORTED``            attr available selection modes
> +    ``SOURCE_PIN_IDX``            attr index of currently selected
> +                                  source
> +    ``LOCK_STATUS``               attr internal frequency-lock status
> +    ``TEMP``                      attr device temperature information
> +    ``NETIFINDEX``                attr dpll owner Linux netdevice index
> +
> +
> +The pre-defined enums
> +=====================
> +
> +All the enums use the ``DPLL_`` prefix.
> +
> +Values for ``PIN_TYPE`` and ``PIN_TYPE_SUPPORTED`` attributes:
> +
> +  ============================ ========================================
> +  ``PIN_TYPE_MUX``             MUX type pin, connected pins shall
> +                               have their own types
> +  ``PIN_TYPE_EXT``             External pin
> +  ``PIN_TYPE_SYNCE_ETH_PORT``  SyncE on Ethernet port
> +  ``PIN_TYPE_INT_OSCILLATOR``  Internal Oscillator (i.e. Holdover
> +                               with Atomic Clock as a Source)
> +  ``PIN_TYPE_GNSS``            GNSS 1PPS source
> +
> +Values for ``PIN_SIGNAL_TYPE`` and ``PIN_SIGNAL_TYPE_SUPPORTED``
> +attributes:
> +
> +  ===============================  ===================================
> +  ``PIN_SIGNAL_TYPE_1_PPS``        1 Hz frequency
> +  ``PIN_SIGNAL_TYPE_10_MHZ``       10 MHz frequency
> +  ``PIN_SIGNAL_TYPE_CUSTOM_FREQ``  Frequency value provided in attr
> +                                   ``PIN_CUSTOM_FREQ``
> +
> +Values for ``LOCK_STATUS`` attribute:
> +
> +  ============================= ======================================
> +  ``LOCK_STATUS_UNLOCKED``      DPLL is in freerun, not locked to any
> +                                source pin
> +  ``LOCK_STATUS_CALIBRATING``   DPLL device calibrates to lock to the
> +                                source pin signal
> +  ``LOCK_STATUS_LOCKED``        DPLL device is locked to the source
> +                                pin frequency
> +  ``LOCK_STATUS_HOLDOVER``      DPLL device lost a lock, using its
> +                                frequency holdover capabilities
> +
> +Values for ``PIN_STATE`` and ``PIN_STATE_SUPPORTED`` attributes:
> +
> +============================= ============================
> +  ``PIN_STATE_CONNECTED``     Pin connected to a dpll
> +  ``PIN_STATE_DISCONNECTED``  Pin disconnected from dpll
> +  ``PIN_STATE_SOURCE``        Source pin
> +  ``PIN_STATE_OUTPUT``        Output pin
> +
> +Possible DPLL source selection mode values:
> +
> +  =================== ================================================
> +  ``MODE_FORCED``     source pin is force-selected by
> +                      ``DPLL_CMD_DEVICE_SET`` with given value of
> +                      ``DPLLA_SOURCE_PIN_IDX`` attribute
> +  ``MODE_AUTOMATIC``  source pin ise auto selected according to

typo above 'ise' -> 'is'


Cheers,

Paolo

