Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from imap1.codethink.co.uk ([176.9.8.82]:39840 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387847AbeGWMc4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Jul 2018 08:32:56 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Mon, 23 Jul 2018 12:32:08 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, pgaikwad@nvidia.com,
        jonathanh@nvidia.co, thierry.reding@gmail.com,
        linux-kernel@lists.codethink.co.uk
Subject: Re: [PATCH 2/8] clk: tegra: host1x has fractional divider
In-Reply-To: <20180723111216.GM1636@tbergstrom-lnx.Nvidia.com>
References: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
 <20180720134532.13148-3-ben.dooks@codethink.co.uk>
 <20180723085010.GK1636@tbergstrom-lnx.Nvidia.com>
 <7df28a76490315402d28ad7de43dc0db@codethink.co.uk>
 <20180723111216.GM1636@tbergstrom-lnx.Nvidia.com>
Message-ID: <0e52ce60b6d0aed73ca171352a56d3e7@codethink.co.uk>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 2018-07-23 12:12, Peter De Schrijver wrote:
> On Mon, Jul 23, 2018 at 10:32:58AM +0100, Ben Dooks wrote:
>> 
>> 
>> On 2018-07-23 09:50, Peter De Schrijver wrote:
>> >On Fri, Jul 20, 2018 at 02:45:26PM +0100, Ben Dooks wrote:
>> >>The host1x clock according to both tegra2 and tegra3 manuals is
>> >>an 8bit divider with lsb being fractional. This is running into
>> >>an issue where the host1x is being set on a tegra20a system to
>> >>266.4MHz but ends up at 222MHz instead.
>> >>
>> >
>> >The fact the hw has a fractional divider, does not mean we're
>> >allowed to use
>> >it. Due to the non 50% duty cycle of fractional divided clocks,
>> >they are not
>> >allowed for certain peripherals. Do you have information
>> >indicating this is
>> >ok for the host1x clock?
>> 
>> Only that's what was setup for the systems we're using.
>> We couldn't match the 2.6 working system without these changes.
>> 
> 
> On Tegra20 or Tegra30?

I'll check tomorrow when I have access to all the hw involved.

-- 
Ben

